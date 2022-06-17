// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/media/media_bottom_sheet.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/misc/index.dart';
import 'package:provider/provider.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    required this.index,
    required this.photo,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int index;
  final PhotoEntity photo;
  final VoidCallback onTap;

  void _onLongPress(BuildContext context) {
    showMediaBottomSheet(
      context,
      url: photo.photoData.bestUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaledHeight =
        photo.photoData.height * (MediaQuery.of(context).size.width / photo.photoData.width);
    final aspectRatio = Size(MediaQuery.of(context).size.width, scaledHeight).aspectRatio;

    final br = context.watch<LayoutConfigCubit>().state.borderRadius;

    return ClipRRect(
      borderRadius: br,
      child: Hero(
        tag: '$index-${photo.photoData.appropriateUrl}',
        placeholderBuilder: (_, __, child) => child,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: () => _onLongPress(context),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: AppImage(
              imageUrl: photo.photoData.appropriateUrl!,
              fit: BoxFit.cover,
              borderRadius: br,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}

class PhotoCardBase extends StatelessWidget {
const PhotoCardBase({
    required this.index,
    required this.photo,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final int index;
  final PhotoEntity photo;
  final VoidCallback onTap;

  void _onLongPress(BuildContext context) {
    showMediaBottomSheet(
      context,
      url: photo.photoData.bestUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaledHeight =
        photo.photoData.height * (MediaQuery.of(context).size.width / photo.photoData.width);
    final aspectRatio = Size(MediaQuery.of(context).size.width, scaledHeight).aspectRatio;

    final br = context.watch<LayoutConfigCubit>().state.borderRadius;

    return ClipRRect(
      borderRadius: br,
      child: Hero(
        tag: '$index-${photo.photoData.appropriateUrl}',
        placeholderBuilder: (_, __, child) => child,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: () => _onLongPress(context),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: AppImage(
              imageUrl: photo.photoData.appropriateUrl!,
              fit: BoxFit.cover,
              borderRadius: br,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
