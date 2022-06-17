import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/widgets/photos_grid_view.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/entities/photo_entity.dart';
import 'package:jwallpaper/src/config/layout/index.dart';

import 'package:provider/provider.dart';

/// Builds a [CustomScrollView] for the [photos].
///
/// An optional list of [beginSlivers] are built before the [photos] and
/// [endSlivers] are built after the [photos].
class PhotosList extends StatelessWidget {
  const PhotosList(
    this.photos, {
    this.controller,
    this.beginSlivers = const [],
    this.endSlivers = const [],
    this.enableScroll = true,
    Key? key,
  }) : super(key: key);

  /// The list of posts to be displayed in this list.
  final List<PhotoEntity> photos;

  final ScrollController? controller;

  /// Slivers built at the beginning of the [CustomScrollView].
  final List<Widget> beginSlivers;

  /// Slivers built at the end of the [CustomScrollView].
  final List<Widget> endSlivers;

  /// Whether the post list should be scrollable.
  final bool enableScroll;

  @override
  Widget build(BuildContext context) {
    final config = context.watch<LayoutConfigCubit>().state;

    return CustomScrollView(
      controller: controller,
      physics: enableScroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      slivers: [
        ...beginSlivers,
        SliverPadding(
          padding: config.edgeInsets,
          sliver: SliverPhotosGridView(photos: photos),
        ),
        ...endSlivers,
      ],
    );
  }
}
