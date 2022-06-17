import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/buttons/index.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton.flat(
      padding: const EdgeInsets.all(16),
      icon: const RotatedBox(
        quarterTurns: 1,
        child: Icon(EvaIcons.barChart2),
      ),
      onTap: Scaffold.of(context).openDrawer,
    );
  }
}
