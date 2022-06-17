import 'package:flutter/foundation.dart';
import 'package:jwallpaper/src/app/presentations/root/root_screen.dart';
import 'package:jwallpaper/src/config/developer/logger/init_logger.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/base/base_provider.dart';
import 'package:jwallpaper/src/core/base/view_state.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/routes/app_navigator.dart';
import 'package:jwallpaper/src/core/storage/index.dart';

class AppViewModel extends BaseProvider {
  AppViewModel({
    required this.themeBloc,
    required this.layoutConfigCubit,
  }) {
    _initalize();
  }

  final ThemeBloc themeBloc;
  final LayoutConfigCubit layoutConfigCubit;

  Future<void> _initalize() async {
    log.fine('start initalizing app 🏃🏻‍♂️');

    if (!kReleaseMode) {
      initLogger();
    }

    ///Add All initial Future logic inside this method
    await Future.wait([di<AppPreferences>().initialize()]);

    ///Initialze app layout configuration
    layoutConfigCubit.initialize();

    notifyState(const ViewState.dataAvailable());

    ///Navigate to [rootScreen]
    di<AppNavigator>().pushReplacementNamed(RootScreen.route);

    log.fine('app initialized successfully ❣️');
  }
}
