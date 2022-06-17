import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/media/media_timeline.dart';
import 'package:jwallpaper/src/app/presentations/common/misc/default_app_bar.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_content_padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MediaTimeline(
      listKey: PageStorageKey('media_timeline'),
      refreshIndicatorOffset: 16,
      beginSlivers: [
        DefaultSliverAppBar(title: 'JWallpaper'),
      ],
      endSlivers: [MainBottomSliverPadding()],
    );
  }
}
