import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:provider/provider.dart';

class AppThemeObserver extends StatelessWidget {
  const AppThemeObserver({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProxyProvider2<ThemeBloc, Brightness, AppTheme>(
      update: (_, themeBloc, systemBrightness, __) {
        return systemBrightness == Brightness.light
            ? themeBloc.state.lightAppTheme
            : themeBloc.state.darkAppTheme;
      },
      builder: (context, _) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.watch<AppTheme>().systemUiStyle,
        child: child,
      ),
    );
  }
}
