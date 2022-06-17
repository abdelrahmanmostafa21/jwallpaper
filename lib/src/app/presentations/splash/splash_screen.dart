import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';

/// The initial screen that is shown when opening the app.
///
/// After initialization, the `[ApplicationCubit]` will navigate to either the
/// `[LoginScreen]` or the `[HomeScreen]`.
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }
}
