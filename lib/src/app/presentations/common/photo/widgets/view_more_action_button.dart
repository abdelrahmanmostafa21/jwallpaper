import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';

/// Builds a button that is intended to be used to show a klliq bottom sheet.
class ViewMoreActionButton extends StatelessWidget {
  const ViewMoreActionButton({
    required this.onTap,
    Key? key,
    this.padding = const EdgeInsets.all(16),
    this.sizeDelta = 0,
  }) : super(key: key);

  final VoidCallback onTap;
  final EdgeInsets padding;
  final double sizeDelta;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppButton.flat(
      icon: Icon(
        CupertinoIcons.ellipsis_vertical,
        size: theme.iconTheme.size! + sizeDelta,
      ),
      padding: padding,
      onTap: onTap,
    );
  }
}
