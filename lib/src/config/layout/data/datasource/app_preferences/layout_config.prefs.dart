import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/storage/index.dart';

enum _LayoutConfigPrefsKeys {
  //** Font Keys
  fontSizeDeltaId,
  displayFontFamily,
  bodyFontFamily,
  //** Theme Screen Mode Keys
  compactMode,
}

class LayoutConfigPrefsImpl implements LayoutConfigDatasource {
   LayoutConfigPrefsImpl();
  
   Locale? _locale;

  //* Font **************************************************************/

  @override
  String get bodyFontFamily => di<AppPreferences>().getString(
        _LayoutConfigPrefsKeys.bodyFontFamily.name,
        kBodyFontFamily[_locale?.languageCode == 'ar' ? 1 : 0],
      );
  @override
  set bodyFontFamily(String value) =>
      di<AppPreferences>().setString(_LayoutConfigPrefsKeys.bodyFontFamily.name, value);

  @override
  String get displayFontFamily => di<AppPreferences>().getString(
        _LayoutConfigPrefsKeys.displayFontFamily.name,
        kDisplayFontFamily[_locale?.languageCode == 'ar' ? 1 : 0],
      );
  @override
  set displayFontFamily(String value) =>
      di<AppPreferences>().setString(_LayoutConfigPrefsKeys.displayFontFamily.name, value);

  @override
  int get fontSizeDeltaId =>
      di<AppPreferences>().getInt(_LayoutConfigPrefsKeys.fontSizeDeltaId.name, 0);

  @override
  set fontSizeDeltaId(int value) =>
      di<AppPreferences>().setInt(_LayoutConfigPrefsKeys.fontSizeDeltaId.name, value);

  //* Screen **************************************************************/

  @override
  bool get compactMode => false;

  @override
  set compactMode(bool value) =>
      di<AppPreferences>().setBool(_LayoutConfigPrefsKeys.compactMode.name, value);

  @override
  void resetToDefault() {
    fontSizeDeltaId = 0;
    compactMode = false;
    displayFontFamily = kDisplayFontFamily[_locale?.languageCode == 'ar' ? 1 : 0];
    bodyFontFamily = kBodyFontFamily[_locale?.languageCode == 'ar' ? 1 : 0];
  }

  @override
  void setLocale([Locale? locale]) {
    _locale = locale;
  }
}
