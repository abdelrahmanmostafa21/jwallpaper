import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/common/index.dart';
import 'package:jwallpaper/src/app/presentations/splash/splash_screen.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/routes/app_navigator.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();
    final systemBrightness = context.watch<Brightness>();

    return MaterialApp(
      title: 'JWallpaper',
      debugShowCheckedModeBanner: false,
      theme: themeBloc.state.lightAppTheme.themeData,
      darkTheme: themeBloc.state.darkAppTheme.themeData,
      themeMode: systemBrightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
      color: Colors.black,
      navigatorKey: di<AppNavigator>().key,
      onGenerateRoute: onGenerateRoute,
      navigatorObservers: [appRouteObserver],
      builder: (_, child) => AppBuilder(child: child),
      home: const SplashScreen(),
    );
  }
}
