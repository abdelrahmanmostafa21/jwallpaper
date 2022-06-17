
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/widgets/animations/index.dart';
import 'package:shimmer/shimmer.dart';

/// that displays the [child] in a [Shimmer] animation.
class BoxLoadingShimmer extends StatelessWidget {
  const BoxLoadingShimmer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FadeAnimation(
      duration: kShortAnimationDuration,
      curve: Curves.easeInOut,
      child: Shimmer(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.secondary,
            theme.cardTheme.color!.withOpacity(.5),
            theme.cardTheme.color!.withOpacity(.5),
            theme.colorScheme.secondary,
            theme.cardTheme.color!.withOpacity(.3),
            theme.cardTheme.color!.withOpacity(.3),
          ],
        ),
        child: child,
      ),
    );
  }
}
