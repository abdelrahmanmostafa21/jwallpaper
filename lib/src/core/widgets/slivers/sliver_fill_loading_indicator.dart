import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/core/widgets/animations/index.dart';

/// A loading indicator for the center of a [CustomScrollView].
class SliverFillLoadingIndicator extends StatelessWidget {
  const SliverFillLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: FadeAnimation(
        duration: kShortAnimationDuration,
        curve: Curves.easeInOut,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
