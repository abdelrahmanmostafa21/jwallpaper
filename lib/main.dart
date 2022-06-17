import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/app.dart';
import 'package:jwallpaper/src/app/common/index.dart';

import 'package:jwallpaper/src/core/di/service_locator.dart' as di;

void main() => _initalize();

Future<void> _initalize() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setupServices();

  ///Run The App, Using The [AppGuard]
  ///This Will Handle The Errors In The App
  AppGuard(
    child: const AppProviders(
      child: App(),
    ),
  );
}
