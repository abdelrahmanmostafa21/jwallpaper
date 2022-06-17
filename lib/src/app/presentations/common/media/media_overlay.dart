import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:jwallpaper/src/app/presentations/common/media/overlay_action_row.dart';
import 'package:jwallpaper/src/app/presentations/common/media/overlay_media_model.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/view_model/photo_view_model.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/errors/handle_error_extension.dart';
import 'package:jwallpaper/src/core/errors/network_error_handler.dart';
import 'package:jwallpaper/src/core/routes/app_navigator.dart';
import 'package:jwallpaper/src/core/routes/transitions/hero_dialog_route.dart';
import 'package:jwallpaper/src/core/utils/services/index.dart';
import 'package:jwallpaper/src/core/utils/shared/string.utils.dart';
import 'package:jwallpaper/src/core/utils/shared/url_launcher.dart';
import 'package:jwallpaper/src/core/widgets/alerts/index.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';
import 'package:jwallpaper/src/core/widgets/misc/custom_dismissible.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

/// Default behavior to open a post media externally.
void defaultOnMediaOpenExternally(String? mediaUrl) {
  if (mediaUrl != null) {
    launchUrl(mediaUrl);
  }
}

/// Default behavior to download a photo media.
Future<void> defaultOnMediaDownload(String? mediaUrl) async {
  if (mediaUrl != null) {
    final fileName = fileNameFromUrl(mediaUrl);

    if (fileName != null) {
      final notifier = ValueNotifier<DownloadStatus>(
        const DownloadStatus(
          message: 'downloading photo...',
          state: DownloadState.inProgress,
        ),
      );

      final snackBar = SnackBar(
        content: DownloadStatusMessage(notifier: notifier),
        duration: const Duration(seconds: 15),
      );

      await di<DownloadService>()
          .download(
            url: mediaUrl,
            name: fileName,
            onStart: () => di<MessageService>().showCustom(snackBar),
            onSuccess: (file) async {
              await GallerySaver.saveImage(file.path);
              notifier.value = DownloadStatus(
                message: '$fileName photo saved',
                state: DownloadState.successful,
              );
            },
            onFailure: () => notifier.value = const DownloadStatus(
              message: 'download failed',
              state: DownloadState.failed,
            ),
          )
          .handleError(silentErrorHandler);

      // hide snack bar shortly after download finished (assuming it's
      // still showing)
      await Future<void>.delayed(const Duration(seconds: 4));
      di<MessageService>().messageState.state.hideCurrentSnackBar();
    }
  }
}

/// Default behavior to share a post media.
void defaultOnMediaShare(String? mediaUrl) {
  if (mediaUrl != null) {
    Share.share(mediaUrl);
  }
}

class MediaOverlay extends StatefulWidget {
  const MediaOverlay({
    required this.child,
    required this.onDownload,
    required this.onOpenExternally,
    required this.onShare,
    Key? key,
    this.enableImmersiveMode = true,
    this.enableDismissible = true,
    this.overlap = false,
  }) : super(key: key);

  final Widget child;

  /// When set to `true`, tapping the [child] will hide the overlay and disable
  /// the system ui.
  final bool enableImmersiveMode;

  /// Wraps the child in a [CustomDismissible] when set to `true`.
  final bool enableDismissible;

  /// Whether the overlay should overlap the [child].
  final bool overlap;

  final VoidCallback onDownload;
  final VoidCallback onOpenExternally;
  final VoidCallback onShare;

  /// Pushes the [MediaOverlay] with a [HeroDialogRoute].
  ///
  /// When no [onDownload], [onOpenExternally] and [onShare] callbacks are
  /// provided, the default implementations will be used.
  static void open({
    required PhotoViewModel viewModel,
    required Widget child,
    bool enableImmersiveMode = true,
    bool enableDismissible = true,
    bool overlap = false,
    VoidCallback? onDownload,
    VoidCallback? onOpenExternally,
    VoidCallback? onShare,
  }) {
    final photo = viewModel.photo;

    final mediaUrl = photo.photoData.bestUrl;

    di<AppNavigator>().push(
      HeroDialogRoute<void>(
        onBackgroundTap: di<AppNavigator>().maybePop,
        builder: (context) => ChangeNotifierProvider.value(
          value: viewModel,
          child: MediaOverlay(
            enableImmersiveMode: enableImmersiveMode,
            enableDismissible: enableDismissible,
            overlap: overlap,
            onDownload: onDownload ?? () => defaultOnMediaDownload(mediaUrl),
            onOpenExternally: onOpenExternally ?? () => defaultOnMediaOpenExternally(mediaUrl),
            onShare: onShare ?? () => defaultOnMediaShare(mediaUrl),
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  _MediaOverlayState createState() => _MediaOverlayState();
}

class _MediaOverlayState extends State<MediaOverlay>
    with SingleTickerProviderStateMixin<MediaOverlay>, RouteAware {
  late AnimationController _controller;
  late Animation<Offset> _topAnimation;
  late Animation<Offset> _bottomAnimation;

  late OverlayMediaModel _model;

  @override
  void initState() {
    super.initState();

    _model = OverlayMediaModel();

    _controller = AnimationController(
      vsync: this,
      duration: kShortAnimationDuration,
    );

    _topAnimation = Tween(
      begin: Offset.zero,
      end: const Offset(0, -1),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _bottomAnimation = Tween(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.reverse(from: 1);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appRouteObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didPop() {
    _model.resetOverlays();
    _controller.forward();
  }

  void _onMediaTap() {
    if (_model.showingOverlays) {
      _controller.forward(from: 0);
    } else {
      _controller.reverse(from: 1);
    }

    _model.toggleOverlays();
  }

  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            Colors.transparent,
          ],
        ),
      ),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: const AppBackButton(color: Colors.white),
      ),
    );
  }

  Widget _buildActions() {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black87,
          ],
        ),
      ),
      padding: EdgeInsets.only(bottom: mediaQuery.padding.bottom),
      child: MediaOverlayActionRow(
        onDownload: widget.onDownload,
        onOpenExternally: widget.onOpenExternally,
        onShare: widget.onShare,
      ),
    );
  }

  Widget _buildMedia() {
    Widget child = Center(child: widget.child);

    if (widget.enableImmersiveMode) {
      child = GestureDetector(
        onTap: _onMediaTap,
        child: child,
      );
    }

    if (widget.enableDismissible) {
      child = CustomDismissible(
        onDismissed: di<AppNavigator>().maybePop,
        child: child,
      );
    }

    return child;
  }

  Widget _buildOverlappingOverlay() {
    return Stack(
      children: [
        _buildMedia(),
        AnimatedBuilder(
          animation: _controller,
          builder: (_, __) => Column(
            children: [
              SlideTransition(
                position: _topAnimation,
                child: _buildAppBar(),
              ),
              const Spacer(),
              SlideTransition(
                position: _bottomAnimation,
                child: _buildActions(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOverlay() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Column(
        children: [
          SlideTransition(
            position: _topAnimation,
            child: _buildAppBar(),
          ),
          Expanded(child: _buildMedia()),
          SlideTransition(
            position: _bottomAnimation,
            child: _buildActions(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.overlap ? _buildOverlappingOverlay() : _buildOverlay();
  }
}
