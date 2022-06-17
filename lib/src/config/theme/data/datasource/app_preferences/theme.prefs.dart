

import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/storage/index.dart';

enum _ThemePrefsKeys { lightThemeId, darkThemeId, customThemes }

class ThemePrefsImpl implements ThemeDatasource {
  const ThemePrefsImpl();

  /// The id of the selected light and dark themes.
  ///
  /// - 0..9: index of predefined theme (unused indices are reserved)
  /// - 10+:  index of custom theme
  ///
  /// Defaults to 0 for the dark theme and 1 for the light theme.
  @override
  int get lightThemeId =>
      di<AppPreferences>().getInt(_ThemePrefsKeys.lightThemeId.name, 1, prefix: true);
  @override
  set lightThemeId(int value) =>
      di<AppPreferences>().setInt(_ThemePrefsKeys.lightThemeId.name, value, prefix: true);

  @override
  int get darkThemeId =>
      di<AppPreferences>().getInt(_ThemePrefsKeys.darkThemeId.name, 0, prefix: true);
  @override
  set darkThemeId(int value) =>
      di<AppPreferences>().setInt(_ThemePrefsKeys.darkThemeId.name, value, prefix: true);

  /// A list of encoded dokan theme data representing custom themes.
  @override
  List<String> get customThemes =>
      di<AppPreferences>().getStringList(_ThemePrefsKeys.customThemes.name, prefix: true);
  @override
  set customThemes(List<String?> value) =>
      di<AppPreferences>().setStringList(_ThemePrefsKeys.customThemes.name, value, prefix: true);
}
