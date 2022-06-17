import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';

/// Handles loading, updating and persisting the [LayoutConfig] which is used for
/// configuration of ui components in the app.
class LayoutConfigCubit extends Cubit<LayoutConfig> {
  LayoutConfigCubit() : super(LayoutConfig.defaultConfig);

  final _dataSource = di<LayoutConfigDatasource>();

  void initialize([Locale? locale]) {
    _dataSource.setLocale(locale);
    final fontSizeDeltaId = _dataSource.fontSizeDeltaId;
    final compactMode = _dataSource.compactMode;
    final displayFontFamily = _dataSource.displayFontFamily;
    final bodyFontFamily = _dataSource.bodyFontFamily;

    emit(
      state.copyWith(
        compactMode: compactMode,
        fontSizeDelta: LayoutConfig.fontSizeDeltaIdMap[fontSizeDeltaId] ?? 0,
        displayFont: displayFontFamily,
        bodyFont: bodyFontFamily,
      ),
    );
  }

  void resetToDefault([Locale? locale]) {
    _dataSource.resetToDefault();
    emit(LayoutConfig.defaultConfig);
  }

  void updateCompactMode(bool value) {
    _dataSource.compactMode = value;
    emit(state.copyWith(compactMode: value));
  }

  void updateFontSizeDelta(double value) {
    final fontSizeDeltaId = LayoutConfig.fontSizeDeltaIdMap.entries
        .firstWhere(
          (element) => element.value == value,
          orElse: () => const MapEntry<int, double>(0, 0),
        )
        .key;

    _dataSource.fontSizeDeltaId = fontSizeDeltaId;

    emit(
      state.copyWith(
        fontSizeDelta: LayoutConfig.fontSizeDeltaIdMap[fontSizeDeltaId] ?? 0,
      ),
    );
  }

  void updateDisplayFont(String fontFamily) {
    _dataSource.displayFontFamily = fontFamily;
    emit(state.copyWith(displayFont: fontFamily));
  }

  void updateBodyFont(String fontFamily) {
    _dataSource.bodyFontFamily = fontFamily;
    emit(state.copyWith(bodyFont: fontFamily));
  }
}
