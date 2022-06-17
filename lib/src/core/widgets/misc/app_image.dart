import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:shimmer/shimmer.dart';

/// Builds a network [Image] with a shimmer loading animation that fades into
/// the loaded image.
class AppImage extends StatelessWidget {
  const AppImage({
    required this.imageUrl,
    Key? key,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  Widget _errorBuilder(
    BuildContext context,
    String url,
    dynamic error,
  ) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 9 / 16,
      child: Container(
        color: theme.cardColor,
        child: FractionallySizedBox(
          widthFactor: .5,
          heightFactor: .5,
          child: FittedBox(
            child: Icon(
              Icons.broken_image_outlined,
              color: theme.iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingBuilder(
    BuildContext context,
    ImageProvider? provider,
  ) {
    final theme = Theme.of(context);

    return AnimatedSwitcher(
      duration: kShortAnimationDuration,
      child: provider != null
          ? Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                image: DecorationImage(
                  image: provider,
                  fit: fit,
                ),
              ),
            )
          : Shimmer(
              gradient: LinearGradient(
                colors: [
                  theme.cardTheme.color!.withOpacity(.3),
                  theme.cardTheme.color!.withOpacity(.3),
                  theme.colorScheme.secondary,
                  theme.cardTheme.color!.withOpacity(.3),
                  theme.cardTheme.color!.withOpacity(.3),
                ],
              ),
              child: Container(color: theme.cardTheme.color),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: ValueKey(imageUrl),
      imageUrl: imageUrl,
      errorWidget: _errorBuilder,
      imageBuilder: _loadingBuilder,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
