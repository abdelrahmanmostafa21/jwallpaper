import 'package:flutter/material.dart';

/// Wraps the [child] with a [Scaffold] and [ScaffoldMessenger] to show
/// [SnackBar]s from anywhere in the app using the [globalKey].
class AppMessage extends StatefulWidget {
  AppMessage({
    required this.child,
  }) : super(key: globalKey);

  final Widget? child;

  static final globalKey = GlobalKey<AppMessageState>();

  @override
  AppMessageState createState() => AppMessageState();
}

class AppMessageState extends State<AppMessage> {
  final GlobalKey<ScaffoldMessengerState> _messengerKey = GlobalKey<ScaffoldMessengerState>();

  ScaffoldMessengerState get state => _messengerKey.currentState!;

  void show(String message, [SnackBarAction? action]) {
    final theme = Theme.of(context);

    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: theme.textTheme.subtitle2,
        ),
        action: action,
      ),
    );
  }

  void showCustom(SnackBar snackBar) {
    _messengerKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _messengerKey,
      child: Scaffold(
        body: widget.child,
      ),
    );
  }
}
