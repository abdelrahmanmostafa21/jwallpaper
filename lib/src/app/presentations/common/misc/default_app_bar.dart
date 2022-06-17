import 'package:flutter/material.dart';
import 'package:jwallpaper/src/core/widgets/slivers/index.dart';

class DefaultSliverAppBar extends StatelessWidget {
  const DefaultSliverAppBar({
    Key? key,
    this.title = '',
    this.showIcon = true,
  }) : super(key: key);

  final String title;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return AppSliverAppBar(
      leading: showIcon ? Image.asset('assets/images/logo.png', height: 50) : null,
      title: title,
      floating: true,
    );
  }
}
