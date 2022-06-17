import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/utils/extensions/index.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';

/// A convenience Widget that wraps a [Scaffold] to build a transparent [AppBar]
/// on top of a [AppBackground].
///
/// If [showIcon] is `true`, the `[appLogo]` is built next to the
/// [title] in the [AppBar].
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    Key? key,
    this.title,
    this.titleWidget,
    this.showIcon = false,
    this.actions,
    this.drawer,
    this.endDrawer,
    this.backgroundColors,
    this.appBarBottom,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.buildSafeArea = false,
    this.shouldRemoveFocus = false,
    this.transparentBg = false,
    this.bottomNavigationBar,
    this.extenedBehindAppBar = false,
    this.leading,
  }) : super(key: key);

  final String? title;
  final Widget? titleWidget;
  final Widget body;
  final bool showIcon;
  final List<Widget>? actions;
  final Widget? drawer;
  final Widget? endDrawer;
  final PreferredSizeWidget? appBarBottom;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool buildSafeArea;
  final bool shouldRemoveFocus;
  final bool transparentBg;
  final Widget? bottomNavigationBar;
  final Widget? leading;

  /// The colors used by the [AppBackground].
  ///
  /// Uses the colors of the current theme if `null`.
  final List<Color>? backgroundColors;
  final bool extenedBehindAppBar;
  bool get _hasAppBar => title != null || leading != null || titleWidget != null || showIcon;

  Widget _buildTitle(ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text('AppLogo'),
          ),
        ],
        if (titleWidget != null)
          titleWidget!
        else if (title != null)
          Text(
            title!,
            style: theme.textTheme.bodyLarge,
          ),
      ],
    );
  }

  Widget? _leading(BuildContext context) {
    if (leading != null) {
      return leading;
    } else {
      return null;
    }
  }

  Widget _buildAppBar(
    BuildContext context,
    ThemeData theme,
    MediaQueryData mediaQuery,
  ) {
    final appBar = AppBar(
      centerTitle: !showIcon,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 5,
      actions: actions,
      leading: _leading(context),
      title: title != null && title!.isNotEmpty || showIcon ? _buildTitle(theme) : null,
      bottom: appBarBottom,
    );

    final topPadding = mediaQuery.padding.top;
    final extent = appBar.preferredSize.height + topPadding;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: extent),
      child: appBar,
    );
  }

  Widget? _buildFloatingActionButton(MediaQueryData mediaQuery) {
    if (floatingActionButton == null) {
      return null;
    } else {
      return Padding(
        // add padding if a bottom nav bar exists
        // Some devices won't draw a bot nav bar, in which case the fab will
        // have the correct padding of 16dp.
        // If a bot nav bar exists we add a padding of 16dp because it will
        // otherwise sit on the bot nav bar without padding.
        padding: EdgeInsets.only(
          bottom: mediaQuery.padding.bottom > 0 ? 16 : 0,
        ),
        child: floatingActionButton,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final child = Scaffold(
      drawer: drawer,
      endDrawer: endDrawer,
      backgroundColor: transparentBg ? Colors.transparent : null,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      floatingActionButton: _buildFloatingActionButton(mediaQuery),
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      body: AppBackground(
        colors: transparentBg ? [Colors.transparent] : backgroundColors,
        child: extenedBehindAppBar
            ? Stack(
                children: [
                  if (buildSafeArea) SafeArea(top: false, child: body) else body,
                  if (_hasAppBar) _buildAppBar(context, theme, mediaQuery),
                ],
              )
            : Column(
                children: [
                  if (_hasAppBar) _buildAppBar(context, theme, mediaQuery),
                  Expanded(
                    child: buildSafeArea ? SafeArea(top: false, child: body) : body,
                  ),
                ],
              ),
      ),
    );
    return shouldRemoveFocus
        ? GestureDetector(
            onTap: () => context.dismissKeyboard(),
            child: child,
          )
        : child;
  }
}
