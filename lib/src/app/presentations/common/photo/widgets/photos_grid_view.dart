import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/media/media_timeline_gallery_overlay.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/photo_card.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/routes/transitions/hero_dialog_route.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class SliverPhotosGridView extends StatelessWidget {
  const SliverPhotosGridView({
    required this.photos,
    this.crossAxisCount = 2,
    Key? key,
  }) : super(key: key);

  final List<PhotoEntity> photos;
  final int crossAxisCount;

  Widget _buildList(BuildContext context, LayoutConfig config, List<PhotoEntity> entries) {
    return SliverWaterfallFlow(
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: config.smallPaddingValue,
        crossAxisSpacing: config.smallPaddingValue,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, index) => _itemBuilder(context, entries, index),
        childCount: entries.length,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, List<PhotoEntity> entries, int index) {
    final entry = entries[index];
    return PhotoCard(
      photo: entry,
      index: index,
      onTap: () => _showGallery(context: context, entries: entries, initialIndex: index),
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = context.watch<LayoutConfigCubit>().state;
    return _buildList(context, config, photos);
  }
}

/// Show the media gallery for the media timeline [entries].
void _showGallery({
  required BuildContext context,
  required List<PhotoEntity> entries,
  required int initialIndex,
}) {
  Navigator.of(context).push<void>(
    HeroDialogRoute<void>(
      builder: (_) => MediaTimelineGalleryOverlay(
        entries: entries,
        initialIndex: initialIndex,
      ),
    ),
  );
}
