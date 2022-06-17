import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwallpaper/src/app/presentations/home/view_model/home_view_model.dart';
import 'package:jwallpaper/src/app/presentations/liked/view_model/liked_view_model.dart';
import 'package:jwallpaper/src/app/view_model/app_view_model.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SystemBrightnessObserver(
      child: MultiProvider(
        providers: [
          //**This The App Core Bloc Providers, Dont Change This.
          BlocProvider(create: (_) => LayoutConfigCubit()),
          BlocProvider(
            create: (context) => ThemeBloc(
              configCubit: context.read<LayoutConfigCubit>(),
            ),
          ),

          //**App Global Providers
          ChangeNotifierProvider(
            lazy: false,
            create: (context) => AppViewModel(
              themeBloc: context.read<ThemeBloc>(),
              layoutConfigCubit: context.read<LayoutConfigCubit>(),
            ),
          ),

          ChangeNotifierProvider(create: (_) => HomeViewModel()),
          ChangeNotifierProvider(create: (_) => LikesViewModel()),
        ],
        child: child,
      ),
    );
  }
}
