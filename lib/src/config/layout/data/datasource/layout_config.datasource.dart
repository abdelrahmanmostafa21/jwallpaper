import 'dart:ui';

abstract class LayoutConfigDatasource {

  int get fontSizeDeltaId;
  set fontSizeDeltaId(int value);

  String get displayFontFamily;
  set displayFontFamily(String value);

  String get bodyFontFamily;
  set bodyFontFamily(String value);

  bool get compactMode;
  set compactMode(bool value);

  void setLocale([Locale? locale]);
  void resetToDefault();
}
