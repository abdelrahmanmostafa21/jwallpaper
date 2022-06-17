import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/widgets/alerts/index.dart';
import 'package:jwallpaper/src/core/widgets/scroll/scroll_behavior.dart';

/// The \\App// Content Builder
/// Builds For Every New Screen/Route initalized
class AppBuilder extends StatelessWidget {
  const AppBuilder({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AppThemeObserver(
      child: ScrollConfiguration(
        behavior: const AppScrollBehavior(),
        child: AppMessage(
          child: child,
        ),
      ),
    );
  }
}
