import 'package:get_it/get_it.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/network/index.dart';
import 'package:jwallpaper/src/core/network/pexel/pexel_client.dart';
import 'package:jwallpaper/src/core/routes/app_navigator.dart';
import 'package:jwallpaper/src/core/storage/index.dart';
import 'package:jwallpaper/src/core/utils/services/index.dart';

/// [GetIt] is a simple service locator for accessing services from anywhere
/// in the app.
final GetIt di = GetIt.instance;

/// Adds the services to the [di] service locator.
void setupServices() {
  di

    /// -> `APP` //* Registers
    ///
    ..registerLazySingleton<AbstractAppClient>(PexelsClient.new)
    //Navigators
    ..registerLazySingleton(AppNavigator.new)
    //StoragePrefs
    ..registerLazySingleton(AppPreferences.new)
    //DataSources
    ..registerLazySingleton<ThemeDatasource>(ThemePrefsImpl.new)
    ..registerLazySingleton<LayoutConfigDatasource>(LayoutConfigPrefsImpl.new)
    //Services
    ..registerLazySingleton(DownloadService.new)
    ..registerLazySingleton(MessageService.new);

}
