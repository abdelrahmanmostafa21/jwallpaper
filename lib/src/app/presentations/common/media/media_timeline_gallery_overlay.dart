import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/media/media_overlay.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/view_model/photo_view_model.dart';
import 'package:jwallpaper/src/app/presentations/liked/view_model/liked_view_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/core/widgets/misc/app_media_gallery.dart';
import 'package:jwallpaper/src/core/widgets/misc/blur.dart';
import 'package:jwallpaper/src/core/widgets/misc/index.dart';
import 'package:provider/provider.dart';

/// Builds a [AppMediaGallery] with a [MediaOverlay] to access the photo
/// actions (favorite) and media actions (open externally, download,
/// share) in the gallery.
class MediaTimelineGalleryOverlay extends StatefulWidget {
  const MediaTimelineGalleryOverlay({
    required this.entries,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  final List<PhotoEntity> entries;
  final int initialIndex;

  @override
  _MediaTimelineGalleryOverlayState createState() => _MediaTimelineGalleryOverlayState();
}

class _MediaTimelineGalleryOverlayState extends State<MediaTimelineGalleryOverlay> {
  late int _index;
  late PhotoEntity _photo;
  late PhotoViewModel _viewModel;

  //Todo:- Handle Multiple Media Types (Demo Ver)
  String? get _mediaUrl => widget.entries[_index].photoData.bestUrl;

  @override
  void initState() {
    super.initState();

    _index = widget.initialIndex;
    _photo = widget.entries[widget.initialIndex];
    _viewModel = PhotoViewModel(
      photo: _photo,
      likesViewModel: context.read<LikesViewModel>(),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onPageChanged(int newIndex) {
    _index = newIndex;

    final newPhoto = widget.entries[newIndex];

    if (mounted && newPhoto.id != _photo.id) {
      setState(() {
        _photo = newPhoto;
        _viewModel = PhotoViewModel(
          photo: _photo,
          likesViewModel: context.read<LikesViewModel>(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: MediaOverlay(
        overlap: true,
        onOpenExternally: () => defaultOnMediaOpenExternally(_mediaUrl),
        onDownload: () => defaultOnMediaDownload(_mediaUrl),
        onShare: () => defaultOnMediaShare(_mediaUrl),
        child: AppMediaGallery.builder(
          itemCount: widget.entries.length,
          initialIndex: widget.initialIndex,
          heroTagBuilder: (index) => '$index-${widget.entries[index].photoData.appropriateUrl}',
          onPageChanged: _onPageChanged,
          builder: (_, index) => AppImage(
            imageUrl: widget.entries[index].photoData.appropriateUrl ?? '',
            fit: BoxFit.cover,
          ).blurred(
            blur: 20,
            blurColor: Colors.black,
            overlay: AppImage(
              imageUrl: widget.entries[index].photoData.appropriateUrl ?? '',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
