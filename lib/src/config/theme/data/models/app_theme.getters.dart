part of 'app_theme.dart';

extension AppThemeGettersExtension on AppTheme {
  Color get foregroundColor => brightness == Brightness.light ? Colors.black : Colors.white;

  bool get isDark => brightness == Brightness.dark;

  SystemUiOverlayStyle get systemUiStyle => SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor: navBarColor,
        systemNavigationBarDividerColor: navBarColor,
        systemNavigationBarIconBrightness: navBarIconBrightness,
      );
}
