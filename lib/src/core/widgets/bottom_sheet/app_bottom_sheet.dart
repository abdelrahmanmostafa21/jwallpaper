import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwallpaper/src/config/constants/theme_constants.dart';
import 'package:jwallpaper/src/core/widgets/bottom_sheet/index.dart';

/// Shows a app styled modal bottom sheet with the [children] in a column.
Future<T?> showAppBottomSheet<T>(
  BuildContext context, {
  required List<Widget> children,
  bool hapticFeedback = true,
  bool scrollControlled = false,
  bool dismissible = true,
}) async {
  if (hapticFeedback) {
    unawaited(HapticFeedback.lightImpact());
  }

  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: scrollControlled,
    isDismissible: dismissible,
    enableDrag: dismissible,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: kRadius,
        topRight: kRadius,
      ),
    ),
    builder: (_) => SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BottomSheetHandle(),
          ...children,
        ],
      ),
    ),
  );
}

Future<T?> showAppBasicBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  bool scrollControlled = false,
  bool hapticFeedback = false,
}) async {
  if (hapticFeedback) {
    unawaited(HapticFeedback.lightImpact());
  }

  return showModalBottomSheet<T>(
    context: context,
    clipBehavior: Clip.hardEdge,
    isScrollControlled: scrollControlled,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: kRadius,
        topRight: kRadius,
      ),
    ),
    builder: (_) => child,
  );
}
