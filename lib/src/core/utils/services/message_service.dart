import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/alerts/index.dart';


class MessageService {
  AppMessageState get messageState => AppMessage.globalKey.currentState!;

  /// Shows a global [SnackBar] using the [AppMessage].
  void show(String message, [SnackBarAction? action]) =>
      messageState.show(message);

  /// Shows a global custom [snackBar]using the [AppMessage].
  void showCustom(SnackBar snackBar) => messageState.showCustom(snackBar);
}
