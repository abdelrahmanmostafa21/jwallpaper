import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTabEntryIcon extends StatelessWidget {
  const MainTabEntryIcon(
    this.iconName, {
    Key? key,
    this.size,
  }) : super(key: key);

  /// The name that matches the icon data in [iconNameMap].
  ///
  /// If the [iconName] is one character long, the text is used as the icon
  /// instead.
  final String? iconName;

  final double? size;

  /// Maps the name of an icon to its [IconData].
  static const Map<String, IconData> iconNameMap = <String, IconData>{
    // default
    'crop': EvaIcons.cropOutline,
    'image': EvaIcons.image2,
    'heart': EvaIcons.heartOutline,
    'search': EvaIcons.searchOutline,
  };

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? Theme.of(context).iconTheme.size!;

    if (iconName?.length == 1) {
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        child: Text(
          iconName!,
          style: TextStyle(
            fontSize: size,
            height: 1,
          ),
          overflow: TextOverflow.clip,
        ),
      );
    } else {
      return Icon(
        iconNameMap[iconName] ?? CupertinoIcons.circle,
        size: size,
      );
    }
  }
}
