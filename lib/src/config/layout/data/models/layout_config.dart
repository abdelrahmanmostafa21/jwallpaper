import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';

/// Configuration for ui components of the app.
class LayoutConfig extends Equatable {
  const LayoutConfig({
    required this.fontSizeDelta,
    required this.compactMode,
    required this.displayFont,
    required this.bodyFont,
    required this.bottomAppBar,
    required this.hideMainTabBar,
  });

  final double fontSizeDelta;
  final bool compactMode;
  final String displayFont;
  final String bodyFont;
  final bool bottomAppBar;
  final bool hideMainTabBar;

  static final defaultConfig = LayoutConfig(
    fontSizeDelta: 0,
    compactMode: false,
    displayFont: kDisplayFontFamily[0],
    bodyFont: kBodyFontFamily[0],
    bottomAppBar: true,
    hideMainTabBar: true,
  );

  @override
  List<Object?> get props => [
        fontSizeDelta,
        compactMode,
        displayFont,
        bodyFont,
        bottomAppBar,
        hideMainTabBar,
      ];

  LayoutConfig copyWith({
    double? fontSizeDelta,
    bool? compactMode,
    String? displayFont,
    String? bodyFont,
    bool? hideBottomBar,
    bool? regularTabBar,
    bool? bottomAppBar,
    bool? hideMainTabBar,
  }) {
    return LayoutConfig(
      fontSizeDelta: fontSizeDelta ?? this.fontSizeDelta,
      compactMode: compactMode ?? this.compactMode,
      displayFont: displayFont ?? this.displayFont,
      bodyFont: bodyFont ?? this.bodyFont,
      bottomAppBar: bottomAppBar ?? this.bottomAppBar,
      hideMainTabBar: hideMainTabBar ?? this.hideMainTabBar,
    );
  }

  /// Maps the id of the font size to the font size delta value.
  static const fontSizeDeltaIdMap = <int, double>{
    -2: -4,
    -1: -2,
    0: 0,
    1: 2,
    2: 4,
  };

  /// Maps the id of the font size to its display name.
  static const fontSizeDeltaIdNameMap = <int, String>{
    -2: 'display.deltaName.-2',
    -1: 'display.deltaName.-1',
    0: 'display.deltaName.0',
    1: 'display.deltaName.1',
    2: 'display.deltaName.2',
  };
}

extension LayoutConfigExtension on LayoutConfig {
  double get paddingValue => compactMode ? 8 : 12;
  double get smallPaddingValue => paddingValue / 2;

  EdgeInsets get edgeInsets => EdgeInsets.all(paddingValue);

  double get itemCardAspectRatio => 2.5 / 4;
  double get horizItemCardAspectRatio => 1 / 1;

  EdgeInsets edgeInsetsOnly({
    bool left = false,
    bool right = false,
    bool top = false,
    bool bottom = false,
  }) {
    return EdgeInsets.only(
      left: left ? paddingValue : 0,
      right: right ? paddingValue : 0,
      top: top ? paddingValue : 0,
      bottom: bottom ? paddingValue : 0,
    );
  }

  EdgeInsetsGeometry edgeInsetsDirectionalOnly({
    bool start = false,
    bool end = false,
    bool top = false,
    bool bottom = false,
  }) {
    return EdgeInsetsDirectional.only(
      start: start ? paddingValue : 0,
      end: end ? paddingValue : 0,
      top: top ? paddingValue : 0,
      bottom: bottom ? paddingValue : 0,
    );
  }

  EdgeInsets edgeInsetsSymmetric({
    bool horizontal = false,
    bool vertical = false,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal ? paddingValue : 0,
      vertical: vertical ? paddingValue : 0,
    );
  }

  String get fontSizeDeltaName {
    final deltaId = di<LayoutConfigDatasource>().fontSizeDeltaId;
    return LayoutConfig.fontSizeDeltaIdNameMap[deltaId] ?? 'normal';
  }

  BorderRadius get borderRadius => compactMode ? BorderRadius.zero : kBorderRadius;
  Radius get radius => compactMode ? Radius.zero : kRadius;
}
