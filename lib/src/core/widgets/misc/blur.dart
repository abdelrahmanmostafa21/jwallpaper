import 'dart:ui';

import 'package:flutter/material.dart';

class Blur extends StatelessWidget {
  const Blur({
    required this.child,
    Key? key,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
    this.alignment = Alignment.center,
    this.fit,
    this.clip,
  }) : super(key: key);

  final Widget child;
  final double blur;
  final Color blurColor;
  final BorderRadius? borderRadius;
  final double colorOpacity;
  final Widget? overlay;
  final AlignmentGeometry alignment;
  final StackFit? fit;
  final Clip? clip;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipBehavior: clip ?? Clip.antiAlias,
      child: Stack(
        fit: fit ?? StackFit.loose,
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  color: blurColor.withOpacity(colorOpacity),
                ),
                alignment: alignment,
                child: overlay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///extension of [Blur] on [Widget] to blur it's child
///same as a [Blur] widget but you can use this as an extension on any widget which
///you want to have a blur effect
///blur is the value of blur effect, higher the blur more the blur effect (default value = 5)
extension BlurExtension on Widget {
  Blur blurred({
    double blur = 5,
    Color blurColor = Colors.white,
    BorderRadius? borderRadius,
    double colorOpacity = 0.5,
    Widget? overlay,
    AlignmentGeometry alignment = Alignment.center,
    StackFit? fit,
    Clip? clip,
  }) {
    return Blur(
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      overlay: overlay,
      alignment: alignment,
      fit: fit,
      clip: clip,
      child: this,
    );
  }
}

///extension of [Blur] on [Widget] to give the frost effect to background of it's child:-
///creates frosted glass effect: blurs the background of the child given to it
///blur is the value of blur effect, higher the blur more the blur effect (default value = 5)
///frostColor is the color of the frost effect (default value = Colors.white)
///frostOpacity is the opacity of the frostColor (default value = 0.0)
///height is the height of the frost effect
///width is the width of the frost effect
///borderRadius is the radius of the frost effect
///alignment is the alignment geometry of the child (default value = Alignment.center)
///padding is the child padding (default value = EdgeInsets.zero)
extension FrostExtension on Widget {
  Blur frosted({
    double blur = 5,
    Color frostColor = Colors.black,
    AlignmentGeometry alignment = Alignment.center,
    double? height,
    double? width,
    double frostOpacity = 0.0,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Clip? clip,
    StackFit? fit,
  }) {
    return Blur(
      blur: blur,
      blurColor: frostColor,
      borderRadius: borderRadius,
      fit: fit,
      clip: clip,
      alignment: alignment,
      overlay: Padding(
        padding: padding,
        child: this,
      ),
      child: Container(
        height: height,
        width: width,
        padding: padding,
        color: frostColor.withOpacity(frostOpacity),
        child: height == null || width == null ? this : const SizedBox.shrink(),
      ),
    );
  }
}
