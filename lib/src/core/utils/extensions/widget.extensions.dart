import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget onOpacity(double opacity) => Opacity(opacity: opacity, child: this);
  Widget onAnimatedOpacity(double opacity, Duration duration) =>
      AnimatedOpacity(duration: duration, opacity: opacity, child: this);

  Widget onIgnore([bool ignore = true]) => IgnorePointer(ignoring: ignore, child: this);
}
