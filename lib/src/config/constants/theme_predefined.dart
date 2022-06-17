// ignore: implementation_imports

import 'package:jwallpaper/src/config/theme/index.dart';

final predefinedThemes = [light, dark];

const AppThemeData light = AppThemeData(
  name: 'light',
  backgroundColors: [0xff4f148b, 0xFF109187],
  primaryColor: 0xFF12D9F4,
  secondaryColor: 0xFF109187,
  cardColor: 0x147FBB7F,
  statusBarColor: 0x00ffffff,
  navBarColor: 0x00ffffff,
);

const AppThemeData dark = AppThemeData(
  name: 'dark',
  backgroundColors: [0xff2E3440, 0xff12254A],
  primaryColor: 0xFF38C1EF,
  secondaryColor: 0xFF07A497,
  cardColor: 0x385e81ac,
  statusBarColor: 0x002E3440,
  navBarColor: 0x002E3440,
);
