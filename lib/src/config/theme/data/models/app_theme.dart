import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/config/theme/index.dart';

part 'app_theme.functions.dart';
part 'app_theme.getters.dart';

class AppTheme {
  AppTheme.fromData({
    required AppThemeData data,
    required this.layoutConfig,
  }) {
    name = data.name;
    backgroundColors = data.backgroundColors.map(Color.new).toList();
    if (backgroundColors.isEmpty) {
      backgroundColors = [Colors.black];
    }
    primaryColor = Color(data.primaryColor);
    secondaryColor = Color(data.secondaryColor);
    statusBarColor = Color(data.statusBarColor);
    navBarColor = Color(data.navBarColor);

    _setupAverageBackgroundColor();
    _setupBrightness();
    _setupCardColor(data.cardColor);
    _setupButtonTextColor();
    _setupErrorColor();
    _setupForegroundColors();
    _setupActionColors();
    _setupSystemUiColors();
    _setupTextTheme();
    _setupThemeData();
  }

  final LayoutConfig layoutConfig;

  //Custom Theme Name Values
  late String name;
  late List<Color> backgroundColors;
  late Color primaryColor;
  late Color secondaryColor;
  late Color cardColor;
  late Color statusBarColor;
  late Color navBarColor;

  // colors chosen based on their background contrast
  late Color buttonTextColor;
  late Color errorColor;
  late Color favoriteColor;
  late Color cartColor;
  late Color translateColor;

  // calculated values
  late Color averageBackgroundColor;
  late Color alternateCardColor;
  late Color solidCardColor1;
  late Color solidCardColor2;
  late Brightness brightness;
  late Color onPrimary;
  late Color onSecondary;
  late Color onBackground;
  late Color onError;
  late Brightness statusBarBrightness;
  late Brightness statusBarIconBrightness;
  late Brightness navBarIconBrightness;

  late ThemeData themeData;

  late TextTheme _textTheme;
  late double _backgroundLuminance;
}
