import 'package:flutter/material.dart';

/// [ScrollBehavior] implementation that uses the [ClampingScrollPhysics] but
/// never builds a [GlowingOverscrollIndicator] to prevent the android
/// overscroll effect.
class AppScrollBehavior extends ScrollBehavior {
  const AppScrollBehavior();

  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics(
      parent: RangeMaintainingScrollPhysics(),
    );
  }
}
