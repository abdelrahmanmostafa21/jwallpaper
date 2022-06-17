import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {

  /// Dismissises Keyboard From Anywhere For Current Context
  void dismissKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }


}
