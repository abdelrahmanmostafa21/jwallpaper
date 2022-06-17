import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/utils/services/index.dart';

/// Prevents exiting app when pressing the back button once.
class WillPopApp extends StatefulWidget {
  const WillPopApp({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  _WillPopAppState createState() => _WillPopAppState();
}

class _WillPopAppState extends State<WillPopApp> {
  bool _willPop = false;

  void _updateWillPop() {
    _willPop = true;
    Future<void>.delayed(const Duration(seconds: 5)).then(
      (_) => _willPop = false,
    );
  }

  Future<bool> _onWillPop() async {
    // if the current pop request will close the application
    if (!Navigator.of(context).canPop()) {
      if (_willPop) {
        return true;
      } else {
        di<MessageService>().show('Tap Twice To Exit');
        _updateWillPop();
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: widget.child,
    );
  }
}
