import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';

/// Builds a [AppButton] as a [PopupMenuEntry] for a [PopupMenuButton].
class AppPopupMenuItem<T> extends PopupMenuEntry<T> {
  const AppPopupMenuItem({
    Key? key,
    this.value,
    this.enabled = true,
    this.icon,
    this.text,
  }) : super(key: key);

  /// The value that will be returned by [showMenu] if this entry is selected.
  final T? value;

  /// Whether the user is permitted to select this item.
  final bool enabled;

  final Widget? icon;
  final Widget? text;

  @override
  double get height => kMinInteractiveDimension;

  @override
  bool represents(T? value) => value == this.value;

  @override
  AppPopupMenuItemState<T, AppPopupMenuItem<T>> createState() =>
      AppPopupMenuItemState<T, AppPopupMenuItem<T>>();
}

class AppPopupMenuItemState<T, W extends AppPopupMenuItem<T>> extends State<W> {
  @override
  Widget build(BuildContext context) {
    return AppButton.flat(
      icon: widget.icon,
      iconSize: 20,
      text: widget.text,
      dense: true,
      onTap: widget.enabled ? () => Navigator.of(context).pop<T>(widget.value) : null,
    );
  }
}
