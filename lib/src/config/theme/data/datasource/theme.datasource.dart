abstract class ThemeDatasource {

  int get lightThemeId;
  set lightThemeId(int value);
  int get darkThemeId;
  set darkThemeId(int value);

  List<String> get customThemes;
  set customThemes(List<String> value);
}
