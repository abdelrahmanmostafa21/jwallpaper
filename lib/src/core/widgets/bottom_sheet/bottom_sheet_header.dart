import 'package:flutter/material.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:provider/provider.dart';

/// A widget intended to be the first child in a app bottom sheet.
class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    required this.child,
    this.showBackBtn = false,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool showBackBtn;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final config = context.watch<LayoutConfigCubit>().state;
    return Padding(
      padding: config.edgeInsetsSymmetric(vertical: true),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackBtn) const CloseButton(),
          Expanded(
            child: DefaultTextStyle(
              style: theme.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
