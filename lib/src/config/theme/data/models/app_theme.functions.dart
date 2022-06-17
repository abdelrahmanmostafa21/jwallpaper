part of 'app_theme.dart';

extension AppThemeFunctionsExtension on AppTheme {
  /// Reduces the [backgroundColors] to a single interpolated color.
  void _setupAverageBackgroundColor() {
    averageBackgroundColor = backgroundColors.reduce(
      (value, element) => Color.lerp(value, element, .5)!,
    );
  }

  /// Calculates the background brightness by averaging the relative luminance
  /// of each background color.
  ///
  /// Similar to [ThemeData.estimateBrightnessForColor] for multiple colors.
  void _setupBrightness() {
    _backgroundLuminance =
        backgroundColors.map((color) => color.computeLuminance()).reduce((a, b) => a + b) /
            backgroundColors.length;

    // the Material Design color brightness threshold
    const kThreshold = 0.15;

    brightness = (_backgroundLuminance + 0.05) * (_backgroundLuminance + 0.05) > kThreshold
        ? Brightness.light
        : Brightness.dark;
  }

  void _setupCardColor(int? cardColorData) {
    cardColor = cardColorData != null
        ? Color(cardColorData)
        : Color.lerp(
            secondaryColor.withOpacity(.1),
            brightness == Brightness.dark
                ? Colors.white.withOpacity(.2)
                : Colors.black.withOpacity(.2),
            .1,
          )!;

    alternateCardColor = Color.lerp(cardColor, averageBackgroundColor, .9)!.withOpacity(.9);

    solidCardColor1 = Color.lerp(cardColor, averageBackgroundColor, .85)!.withOpacity(1);

    solidCardColor2 = Color.lerp(cardColor, averageBackgroundColor, .775)!.withOpacity(1);
  }

  void _setupButtonTextColor() {
    final ratio = _contrastRatio(
      _backgroundLuminance,
      foregroundColor.computeLuminance(),
    );
    buttonTextColor = ratio >= kTextContrastRatio
        ? averageBackgroundColor
        : brightness == Brightness.dark
            ? Colors.black
            : Colors.white;
  }

  void _setupErrorColor() {
    errorColor = _calculateBestContrastColor(
      colors: [
        const Color(0xFFD21404),
        Colors.red,
        Colors.redAccent,
        Colors.deepOrange,
      ],
      baseLuminance: _backgroundLuminance,
    );
  }

  void _setupForegroundColors() {
    onPrimary = _calculateBestContrastColor(
      colors: [Colors.white, Colors.black],
      baseLuminance: primaryColor.computeLuminance(),
    );

    onSecondary = _calculateBestContrastColor(
      colors: [Colors.white, Colors.black],
      baseLuminance: secondaryColor.computeLuminance(),
    );

    onBackground = _calculateBestContrastColor(
      colors: [Colors.white, Colors.black],
      baseLuminance: _backgroundLuminance,
    );

    onError = _calculateBestContrastColor(
      colors: [Colors.white, Colors.black],
      baseLuminance: errorColor.computeLuminance(),
    );
  }

  /// Contains lighter and darker color variants for the tweet actions and
  /// changes the corresponding color depending on the background contrast.
  void _setupActionColors() {
    favoriteColor = _calculateBestContrastColor(
      colors: [
        Colors.pink[300]!,
        Colors.redAccent[700]!,
      ],
      baseLuminance: _backgroundLuminance,
    );

    cartColor = _calculateBestContrastColor(
      colors: [
        Colors.lightGreen[100]!,
        Colors.green[800]!,
      ],
      baseLuminance: _backgroundLuminance,
    );

    translateColor = _calculateBestContrastColor(
      colors: [
        Colors.lightBlueAccent[100]!,
        Colors.indigoAccent[700]!,
      ],
      baseLuminance: _backgroundLuminance,
    );
  }

  /// Sets the system ui colors and brightness values based on their color and
  /// transparency.
  ///
  /// If the status bar color has transparency, the estimated color on the
  /// background will be used to determine the brightness.
  void _setupSystemUiColors() {
    statusBarBrightness = ThemeData.estimateBrightnessForColor(
      Color.lerp(
        statusBarColor,
        backgroundColors.first,
        1 - statusBarColor.opacity,
      )!,
    );

    statusBarIconBrightness = _complementaryBrightness(statusBarBrightness);

    navBarIconBrightness = _complementaryBrightness(
      ThemeData.estimateBrightnessForColor(
        Color.lerp(
          navBarColor,
          backgroundColors.last,
          1 - navBarColor.opacity,
        )!,
      ),
    );
  }

  void _setupTextTheme() {
    final fontSizeDelta = layoutConfig.fontSizeDelta;
    final textColor = foregroundColor;

    _textTheme = brightness == Brightness.light
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    _textTheme = _textTheme
        .copyWith(
          // headline
          displayLarge: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 64,
              letterSpacing: 6,
              fontWeight: FontWeight.w300,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          displayMedium: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 48,
              letterSpacing: 2,
              fontWeight: FontWeight.w300,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          displaySmall: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 22,
              letterSpacing: 2,
              fontWeight: FontWeight.w300,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          headlineLarge: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 48,
              letterSpacing: 2,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          headlineMedium: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 35,
              letterSpacing: 2,
              fontWeight: FontWeight.w300,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          headlineSmall: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 20,
              letterSpacing: 2,
              fontWeight: FontWeight.w300,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),

          // subtitle
          titleLarge: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 22,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          titleMedium: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          titleSmall: _applyCustomDisplayFont(
            textStyle: const TextStyle(
              height: 1.1,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),

          // body
          bodyLarge: _applyCustomBodyFont(
            textStyle: const TextStyle(
              fontSize: 20,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          bodyMedium: _applyCustomBodyFont(
            textStyle: const TextStyle(
              fontSize: 16,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          bodySmall: _applyCustomBodyFont(
            textStyle: TextStyle(
              fontSize: 12,
              color: textColor.withOpacity(.7),
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),

          labelLarge: _applyCustomBodyFont(
            textStyle: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          labelMedium: _applyCustomBodyFont(
            textStyle: const TextStyle(
              fontSize: 14,
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
          labelSmall: _applyCustomDisplayFont(
            textStyle: TextStyle(
              fontSize: 10,
              letterSpacing: .4,
              color: textColor.withOpacity(.7),
              fontFamilyFallback: fontFamilyFallback,
            ),
          ),
        )
        .apply(fontSizeDelta: fontSizeDelta);
  }

  TextStyle _applyCustomDisplayFont({
    required TextStyle textStyle,
  }) {
    return applyGoogleFont(
      textStyle: textStyle,
      fontFamily: layoutConfig.displayFont,
      fallback: kDisplayFontFamily[1],
    );
  }

  TextStyle _applyCustomBodyFont({
    required TextStyle textStyle,
  }) {
    return applyGoogleFont(
      textStyle: textStyle,
      fontFamily: layoutConfig.bodyFont,
      fallback: kBodyFontFamily[1],
    );
  }

  void _setupThemeData() {
    final dividerColor =
        brightness == Brightness.dark ? Colors.white.withOpacity(.2) : Colors.black.withOpacity(.2);

    themeData = ThemeData.from(
      colorScheme: ColorScheme(
        primary: primaryColor,
        primaryContainer: primaryColor,
        secondary: secondaryColor,
        secondaryContainer: secondaryColor,
        surface: primaryColor,
        background: averageBackgroundColor,
        error: errorColor,
        onPrimary: onPrimary,
        onSecondary: onSecondary,
        onSurface: onPrimary,
        onBackground: onBackground,
        onError: onError,
        brightness: brightness,
      ),
      textTheme: _textTheme,
    ).copyWith(
      // determines the status bar icon color
      // used by toggleable widgets
      toggleableActiveColor: secondaryColor,

      // used when interacting with material widgets
      splashColor: secondaryColor.withOpacity(.1),
      highlightColor: secondaryColor.withOpacity(.1),

      dividerColor: dividerColor,

      cardTheme: CardTheme(
        color: cardColor,
        shape: kShapeBorder,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),

      textSelectionTheme: TextSelectionThemeData(
        // cursor color used by text fields
        cursorColor: secondaryColor,
        // used by a text field when it has focus
        selectionHandleColor: secondaryColor,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: foregroundColor,
        backgroundColor: alternateCardColor,
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: averageBackgroundColor,
        contentTextStyle: _textTheme.subtitle2,
        actionTextColor: primaryColor,
        disabledActionTextColor: primaryColor.withOpacity(.5),
        shape: kShapeBorder,
        behavior: SnackBarBehavior.floating,
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: averageBackgroundColor,
        shape: kShapeBorder,
      ),

      iconTheme: const IconThemeData.fallback().copyWith(
        color: foregroundColor,
        size: 20 + layoutConfig.fontSizeDelta,
      ),

      scrollbarTheme: ScrollbarThemeData(
        radius: kRadius,
        thickness: MaterialStateProperty.resolveWith((_) => 3),
        mainAxisMargin: layoutConfig.paddingValue * 2,
        thumbColor: MaterialStateColor.resolveWith(
          (state) => state.contains(MaterialState.dragged)
              ? secondaryColor.withOpacity(.8)
              : secondaryColor.withOpacity(.4),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: dividerColor.withOpacity(0.1),
        filled: true,
        border: const OutlineInputBorder(borderRadius: kBorderRadius),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: kBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: kBorderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: kBorderRadius,
        ),
        contentPadding: layoutConfig.edgeInsets,
      ),
      appBarTheme: AppBarTheme(systemOverlayStyle: systemUiStyle),
    );
  }

  /// Returns the color in [colors] that has the best contrast on the
  /// [baseLuminance].
  Color _calculateBestContrastColor({
    required List<Color> colors,
    required double baseLuminance,
  }) {
    assert(colors.isNotEmpty);

    Color? bestColor;
    double? bestLuminance;

    for (final color in colors) {
      final luminance = _contrastRatio(
        color.computeLuminance(),
        baseLuminance,
      );

      if (bestLuminance == null || luminance > bestLuminance) {
        bestLuminance = luminance;
        bestColor = color;
      }
    }

    return bestColor!;
  }

  Brightness _complementaryBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? Brightness.light : Brightness.dark;
  }

  /// Calculates the contrast ratio of two colors using the W3C accessibility
  /// guidelines.
  ///
  /// Values range from 1 (no contrast) to 21 (max contrast).
  ///
  /// See https://www.w3.org/TR/WCAG20/#contrast-ratiodef.
  double _contrastRatio(double firstLuminance, double secondLuminance) {
    return (max(firstLuminance, secondLuminance) + 0.05) /
        (min(firstLuminance, secondLuminance) + 0.05);
  }
}

TextStyle applyGoogleFont({
  required TextStyle textStyle,
  required String fontFamily,
  String? fallback,
}) {
  if (kAssetFonts.contains(fontFamily)) {
    return textStyle.copyWith(fontFamily: fontFamily);
  }
  //TODO:- Implement Google Fonts Here - This Demo App Theme without using Google Fonts.
  return fallback != null ? textStyle.copyWith(fontFamily: fallback) : textStyle;
}

/// Returns the color for the `[icon]` and `[text]`.
Color calculateForegroundColor(
  ThemeData theme, {
  Color? backgroundColor,
  MaterialType? materialType,
  Color? foregroundColor,
}) {
  if (foregroundColor != null) {
    return foregroundColor;
  } else if (materialType != null && materialType == MaterialType.transparency) {
    // the text color since the button is transparent, therefore directly
    // on the background

    return theme.textTheme.bodyText2!.color!;
  } else if (backgroundColor == null) {
    // don't override the button color

    return theme.textTheme.button!.color!;
  } else {
    // black or white depending on the background color

    final colorOnBackground = Color.lerp(
      theme.backgroundColor,
      backgroundColor,
      backgroundColor.opacity,
    )!;

    return ThemeData.estimateBrightnessForColor(colorOnBackground) == Brightness.light
        ? Colors.black
        : Colors.white;
  }
}
