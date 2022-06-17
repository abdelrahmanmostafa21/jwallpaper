import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/developer/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:logging/logging.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';

/// Handles changing the light and dark themes and loading + updating custom
/// theme data.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required this.configCubit,
  }) : super(
          ThemeState(
            lightThemeData: predefinedThemes[0],
            darkThemeData: predefinedThemes[1],
            config: configCubit.state,
            customThemesData: const [],
          ),
        ) {
    on<ThemeEvent>(
      (event, emit) => event.handle(this, emit),
      transformer: sequential(),
    );

    configCubit.stream.listen((config) {
      add(ThemeEvent.updateConfig(config: config));
    });
  }

  final LayoutConfigCubit configCubit;
}


@freezed
class ThemeState with _$ThemeState {
  factory ThemeState({
    /// The selected light theme which will be used when the device is using the
    /// system light theme.
    required AppThemeData lightThemeData,

    /// The selected dark theme which will be used when the device is using the
    /// system dark theme.
    required AppThemeData darkThemeData,

    /// The list of custom themes for the currently authenticated user.
    required List<AppThemeData> customThemesData,
    required LayoutConfig config,
  }) = _State;

  ThemeState._();

  late final lightAppTheme = AppTheme.fromData(
    data: lightThemeData,
    layoutConfig: config,
  );

  late final darkAppTheme = AppTheme.fromData(
    data: darkThemeData,
    layoutConfig: config,
  );
}
