import 'package:flutter/material.dart';

/// The minimum recommended contrast ratio for the visual representation of
/// text.
///
/// See https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html.
const kTextContrastRatio = 4.5;

/// The minimum recommended contrast ratio for the visual representation of
/// large text.
///
/// See https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html.
const kLargeTextContrastRatio = 3.0;

/// The default border radius used throughout the app.
const kShapeBorder = RoundedRectangleBorder(
  borderRadius: kBorderRadius,
);
const kBorderRadius = BorderRadius.all(kRadius);
const kRadius = Radius.circular(16);

const kSmallShapeBorder = RoundedRectangleBorder(
  borderRadius: kSmallBorderRadius,
);
const kSmallBorderRadius = BorderRadius.all(kSmallRadius);
const kSmallRadius = Radius.circular(8);

/// The default animation durations.
const kShortAnimationDuration = Duration(milliseconds: 300);
const kLongAnimationDuration = Duration(milliseconds: 600);
const kExtraLongAnimationDuration = Duration(milliseconds: 1000);

/// The default fonts.
const kBodyFontFamily = ['OpenSans', 'Cairo'];
const kDisplayFontFamily = ['Comfortaa', 'Tajawal'];

final kAssetFonts = [
  kBodyFontFamily[0],
  kDisplayFontFamily[0],
];

const fontFamilyFallback = ['Comfortaa'];
