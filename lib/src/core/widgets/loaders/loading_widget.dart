import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/routes/app_navigator.dart';

enum LoadingTypes {
  rotatingPlain,
  doubleBounce,
  wave,
  wanderingCubes,
  fadingFour,
  pulse,
  chasingDots,
  threeBounce,
  circle,
  cubeGrid,
  fadingCircle,
  rotatingCircle,
  foldingCube,
  pumpingHeart,
  dualRing,
  hourGlass,
  pouringHourGlass,
  pouringHourGlassRef,
  fadingGrid,
  ring,
  ripple,
  spinningCircle,
  squareCircle,
  spinningLines,
  pianoWave,
  dancingSquare,
  threeInOut
}

///LOADING WIDGET

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.loadingSize,
    this.loadingType = LoadingTypes.foldingCube,
    this.padding,
    this.loadingColor,
    this.isCenter = true,
  }) : super(key: key);
  final double? loadingSize;
  final LoadingTypes loadingType;
  final bool isCenter;
  final EdgeInsetsGeometry? padding;
  final Color? loadingColor;

  static void show({BuildContext? context}) {
    context ??= di<AppNavigator>().key.currentContext!;
    showDialog(
      context: context,
      builder: (_) => const LoadingWidget(),
      barrierDismissible: false,
    );
  }

  static void dismiss() {
    return di<AppNavigator>().pop();
  }

  @override
  Widget build(BuildContext context) {
    return kLoadingWidget(context);
  }

  /// For Loading Widget
  Widget kLoadingWidget(BuildContext context) {
    final size = loadingSize ?? 30.0;

    Widget icon;

    final color = loadingColor ?? Theme.of(context).primaryColor;

    switch (loadingType) {
      case LoadingTypes.rotatingPlain:
        icon = SpinKitRotatingPlain(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.doubleBounce:
        icon = SpinKitDoubleBounce(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.wave:
        icon = SpinKitWave(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.wanderingCubes:
        icon = SpinKitWanderingCubes(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.fadingFour:
        icon = SpinKitFadingFour(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.pulse:
        icon = SpinKitPulse(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.chasingDots:
        icon = SpinKitChasingDots(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.threeBounce:
        icon = SpinKitThreeBounce(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.circle:
        icon = SpinKitCircle(
          color: color,
          size: size,
        );
        break;

      case LoadingTypes.cubeGrid:
        icon = SpinKitCubeGrid(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.fadingCircle:
        icon = SpinKitFadingCircle(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.rotatingCircle:
        icon = SpinKitRotatingCircle(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.foldingCube:
        icon = SpinKitFoldingCube(
          color: color,
          size: size,
        );
        break;

      case LoadingTypes.pumpingHeart:
        icon = SpinKitPumpingHeart(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.dualRing:
        icon = SpinKitDualRing(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.hourGlass:
        icon = SpinKitHourGlass(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.pouringHourGlass:
        icon = SpinKitPouringHourGlass(
          color: color,
          size: size,
        );
        break;

      case LoadingTypes.fadingGrid:
        icon = SpinKitFadingGrid(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.ring:
        icon = SpinKitRing(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.ripple:
        icon = SpinKitRipple(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.spinningCircle:
        icon = SpinKitSpinningCircle(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.squareCircle:
        icon = SpinKitSquareCircle(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.pouringHourGlassRef:
        icon = SpinKitPouringHourGlassRefined(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.spinningLines:
        icon = SpinKitSpinningLines(
          color: color,
          size: size,
        );
        break;
      case LoadingTypes.pianoWave:
        icon = SpinKitPianoWave(
          color: color,
          size: size,
        );
        break;

      case LoadingTypes.dancingSquare:
        icon = SpinKitDancingSquare(
          color: color,
          size: size,
        );
        break;

      case LoadingTypes.threeInOut:
        icon = SpinKitThreeInOut(
          color: color,
          size: size,
        );
        break;
    }
    return SizedBox(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: isCenter
            ? Align(
                child: icon,
              )
            : icon,
      ),
    );
  }
}
