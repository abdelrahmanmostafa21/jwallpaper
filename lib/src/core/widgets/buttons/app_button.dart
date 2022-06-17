import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/theme/data/index.dart';
import 'package:jwallpaper/src/core/widgets/loaders/index.dart';
import 'package:provider/provider.dart';

/// The base for the [AppButton].
///
/// Uses an [AnimatedScale] to have the button appear pressed down while it is
/// tapped.
class _AppButtonBase extends StatefulWidget {
  const _AppButtonBase({
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  _AppButtonBaseState createState() => _AppButtonBaseState();
}

class _AppButtonBaseState extends State<_AppButtonBase> {
  bool _tapDown = false;

  void _updateTapDown(bool value) {
    if (widget.onTap != null && _tapDown != value) {
      setState(() {
        _tapDown = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _tapDown ? .8 : 1,
      duration: kShortAnimationDuration,
      curve: Curves.easeOutCirc,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) => _updateTapDown(true),
        onTapUp: (_) => _updateTapDown(false),
        onTapCancel: () => _updateTapDown(false),
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}

/// A custom button that uses an [AnimatedScale] to appear pressed down on tap.
///
/// The [AppButton.raised] builds a button with elevation and a
/// [backgroundColor].
///
/// The [AppButton.flat] builds a flat button with a transparent background.
///
/// The button can have an [icon] and [text]. When both are not `null`, the
/// icon is built to the left of the text with a padding in between that is
/// half of its vertical padding.
///
/// When [onTap] is `null`, the button will appear disabled by reducing the
/// foreground and background opacity.
///
/// Either [icon] or [text] must not be `null`.
class AppButton extends StatelessWidget {
  const AppButton.gradient({
    required this.onTap,
    Key? key,
    this.text,
    this.icon,
    this.iconSize,
    this.gradient,
    this.dense = false,
    this.padding,
    this.betweenPadding,
    this.foregroundColor,
    this.style,
    this.loadingWidget,
    this.loadingEnabled = false,
    this.fullWidthButton = false,
    this.outerBorder,
    this.outerBorderColor,
    this.borderRadius,
    double? elevation,
  })  : materialType = MaterialType.canvas,
        elevation = elevation ?? 5,
        backgroundColor = null,
        assert(text != null || icon != null),
        super(key: key);

  /// A button that appears raised with a shadow.
  ///
  /// Uses the [AppTheme-foregroundColor] as the [backgroundColor] by default.
  const AppButton.raised({
    required this.onTap,
    Key? key,
    this.text,
    this.icon,
    this.iconSize,
    this.backgroundColor,
    this.dense = false,
    this.padding,
    this.betweenPadding,
    this.foregroundColor,
    this.style,
    this.loadingWidget,
    this.loadingEnabled = false,
    this.fullWidthButton = false,
    this.outerBorder,
    this.outerBorderColor,
    this.borderRadius,
    double? elevation,
  })  : materialType = MaterialType.canvas,
        elevation = elevation ?? 5,
        gradient = null,
        assert(text != null || icon != null),
        super(key: key);

  /// A flat button that has a transparent background and no shadow.
  ///
  /// Should only be used when the context makes it clear it can be tapped.
  const AppButton.flat({
    required this.onTap,
    Key? key,
    this.text,
    this.icon,
    this.iconSize,
    this.dense = false,
    this.padding,
    this.betweenPadding,
    this.foregroundColor,
    this.style,
    this.loadingWidget,
    this.loadingEnabled = false,
    this.fullWidthButton = false,
    this.outerBorder,
    this.outerBorderColor,
    this.borderRadius,
  })  : backgroundColor = null,
        gradient = null,
        materialType = MaterialType.transparency,
        elevation = 0,
        assert(text != null || icon != null),
        super(key: key);

  static _AppButtonBase custom({
    required Widget child,
    required VoidCallback? onTap,
  }) =>
      _AppButtonBase(
        onTap: onTap,
        child: child,
      );

  /// The text widget of the button.
  ///
  /// Can be `null` if the button has no text.
  final Widget? text;

  /// The icon widget of the button.
  ///
  /// Can be `null` if the button has no icon.
  final Widget? icon;

  /// The size of the [icon].
  ///
  /// Defaults to the current icon theme's size.
  final double? iconSize;

  /// The callback when the button is tapped.
  ///
  /// If `null`, the button has reduced transparency to appear disabled.
  final VoidCallback? onTap;

  /// The color of the button.
  ///
  /// Uses the [AppTheme-backgroundColor] if `null`.
  final Color? backgroundColor;

  final LinearGradient? gradient;

  /// The color of the [icon] and [text] of the button.
  ///
  /// Defaults to [TextTheme.button] if the [backgroundColor] is `null`,
  /// to the text foreground color if the [backgroundColor] is transparent or to
  /// white or black when [backgroundColor] is set.
  final Color? foregroundColor;

  /// Merges the [TextTheme.button] style with this [style] to use as the text
  /// style.
  final TextStyle? style;

  /// Whether the button should have less padding.
  ///
  /// Has no effect if [padding] is not `null`.
  final bool dense;

  /// Whether the button should have fullWidthButton to screen.
  ///
  final bool fullWidthButton;

  /// The loading widget of the button.
  ///
  /// Can be `null` if the button loading enabled will use default loader.
  final Widget? loadingWidget;

  /// The loading state of the button.
  ///
  /// [loadingWidget] Can be `null` if the button in loading state.
  final bool loadingEnabled;

  /// The padding for the button.
  ///
  /// Should usually be `null` to use the default padding that is controlled
  /// with [dense] if a smaller padding is required.
  final EdgeInsetsGeometry? padding;

  /// The padding between the [icon] and [text].
  ///
  /// Only has an affect when both [icon] and [text] is not `null`.
  ///
  /// Defaults to half of the vertical padding.
  final double? betweenPadding;

  /// The [elevation] that changes when using a [AppButton.flat] or
  /// [AppButton.raised].
  final double elevation;

  /// Determines the material type that the button uses as its background.
  ///
  /// Set to [MaterialType.transparency] for [AppButton.flat] and
  /// [MaterialType.canvas] for [AppButton.raised].
  final MaterialType materialType;

  final double? outerBorder;

  final Color? outerBorderColor;

  final BorderRadiusGeometry? borderRadius;

  EdgeInsetsGeometry get _padding =>
      padding ??
      EdgeInsets.symmetric(
        vertical: dense ? 8 : 12,
        horizontal: dense ? 16 : 32,
      );

  /// Builds the row with the [Icon] and [Text] widget.
  Widget _buildContent(ThemeData theme) {
    final content = IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (loadingEnabled)
            _loader(theme)
          else ...[
            if (icon != null) icon!,
            if (icon != null && text != null)
              SizedBox(width: betweenPadding ?? _padding.horizontal / 2),
            if (text != null) Expanded(child: text!),
          ]
        ],
      ),
    );

    return content;
  }

  /// Builds the row with the [Icon] and [Text] widget.
  Widget _loader(ThemeData theme) {
    final fgColor = calculateForegroundColor(
      theme,
      foregroundColor: foregroundColor,
      materialType: materialType,
      backgroundColor: backgroundColor,
    );
    return loadingWidget ?? LoadingWidget(loadingColor: fgColor);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = context.watch<AppTheme>();

    final isGradient = gradient != null && materialType != MaterialType.transparency;

    var bgColor = backgroundColor ?? appTheme.foregroundColor;
    var fgColor = calculateForegroundColor(
      theme,
      foregroundColor: foregroundColor,
      materialType: materialType,
      backgroundColor: isGradient ? gradient?.colors.first : bgColor,
    );

    if (onTap == null) {
      // reduce the opacity by 50% when disabled
      bgColor = bgColor.withOpacity(max(0, bgColor.opacity - .5));
      fgColor = fgColor.withOpacity(max(0, fgColor.opacity - .5));
    }

    return _AppButtonBase(
      onTap: onTap,
      child: AnimatedTheme(
        data: theme.copyWith(
          // material background color
          canvasColor: bgColor,

          // text color
          textTheme: TextTheme(
            button: theme.textTheme.button!.copyWith(color: fgColor),
          ),

          // icon color
          iconTheme: theme.iconTheme.copyWith(color: fgColor, size: iconSize),
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            width: fullWidthButton && !loadingEnabled ? double.infinity : null,
            child: Builder(
              builder: (context) {
                final child = Padding(
                  padding: _padding,
                  // use a builder so the context can reference the animated theme
                  child: Builder(
                    builder: (context) => DefaultTextStyle(
                      style: Theme.of(context).textTheme.button!.merge(style).copyWith(
                            color: Theme.of(context).textTheme.button?.color,
                          ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      child: _buildContent(theme),
                    ),
                  ),
                );
                if (isGradient) {
                  return AnimatedOpacity(
                    duration: kShortAnimationDuration,
                    opacity: onTap == null ? .5 : 1,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: gradient,
                        border: outerBorder != null && outerBorder! > 0
                            ? Border.fromBorderSide(
                                BorderSide(
                                  width: outerBorder!,
                                  color: outerBorderColor ?? fgColor,
                                ),
                              )
                            : null,
                        borderRadius: borderRadius ?? kBorderRadius,
                      ),
                      child: child,
                    ),
                  );
                }
                return Material(
                  elevation: elevation,
                  type: materialType,
                  shape: RoundedRectangleBorder(
                    side: outerBorder != null && outerBorder! > 0
                        ? BorderSide(
                            width: outerBorder!,
                            color: outerBorderColor ?? fgColor,
                          )
                        : BorderSide.none,
                    borderRadius: borderRadius ?? kBorderRadius,
                  ),
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
