
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/utils/extensions/index.dart';
import 'package:provider/provider.dart';

/// Builds a background with a gradient from top to bottom.
///
/// The [colors] default to the [AppTheme.backgroundColors] if omitted.
class AppBackground extends StatelessWidget {
  const AppBackground({
    Key? key,
    this.child,
    this.colors,
    this.borderRadius,
    this.dismissKeyboard = true,
    this.buildSafeArea = false,
  }) : super(key: key);

  final Widget? child;
  final List<Color>? colors;
  final bool dismissKeyboard;
  final bool buildSafeArea;

  /// The [borderRadius] of the [BoxDecoration].
  final BorderRadius? borderRadius;

  LinearGradient _buildGradient(List<Color> backgroundColors) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: backgroundColors.length > 1
          ? backgroundColors
          : [
              backgroundColors.first,
              backgroundColors.first,
            ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    final backgroundColors = colors ?? appTheme.backgroundColors;

    final body = GestureDetector(
      onTap: dismissKeyboard ? () => context.dismissKeyboard() : null,
      child: AnimatedContainer(
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: _buildGradient(backgroundColors),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: child ?? const SizedBox(),
        ),
      ),
    );
    if (buildSafeArea) {
      SafeArea(top: false, child: body);
    }

    return body;
  }
}
