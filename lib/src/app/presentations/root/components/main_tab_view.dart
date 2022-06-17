import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/home/home_view.dart';
import 'package:jwallpaper/src/app/presentations/liked/liked_view.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_app_bar.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_drawer.dart';
import 'package:jwallpaper/src/app/presentations/root/model/default_main_tab_entries.dart';
import 'package:jwallpaper/src/app/presentations/root/model/main_tab_entry.dart';
import 'package:jwallpaper/src/app/presentations/root/view_model/main_tab_view_model.dart';
import 'package:jwallpaper/src/app/presentations/search/search_view.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/utils/extensions/index.dart';
import 'package:jwallpaper/src/core/widgets/scroll/scroll_direction_listener.dart';
import 'package:provider/provider.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({Key? key}) : super(key: key);

  Widget _mapEntryContent(
    int index,
    MainTabEntry entry,
    double refreshIndicatorOffset,
  ) {
    final id = entry.id;
    if (id == DefaultMainTabEntriesKeys.home.name) {
      return const HomeView();
    } else if (id == DefaultMainTabEntriesKeys.fav.name) {
      return const LikesView();
    } else if (id == DefaultMainTabEntriesKeys.search.name) {
      return const SearchView();
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final config = context.watch<LayoutConfigCubit>().state;
    final model = context.watch<MainTabViewModel>();

    final refreshIndicatorOffset =
        config.bottomAppBar ? 0.0 : MainAppBar.height(context) + config.paddingValue;

    return DefaultTabController(
      length: model.visibleEntries.length + 1,
      initialIndex: 1,
      child: _MainTabListener(
        child: Stack(
          children: [
            TabBarView(
              children: [
                const MainDrawer(),
                for (var i = 0; i < model.visibleEntries.length; i++)
                  _mapEntryContent(
                    i,
                    model.visibleEntries[i],
                    refreshIndicatorOffset,
                  ),
              ],
            ),
            const MainAppBar(),
          ],
        ),
      ),
    );
  }
}

class _MainTabListener extends StatefulWidget {
  const _MainTabListener({
    required this.child,
  });

  final Widget child;

  @override
  _MainTabListenerState createState() => _MainTabListenerState();
}

class _MainTabListenerState extends State<_MainTabListener> {
  late TabController _controller;
  late ScrollDirection _scrollDirection;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controller = DefaultTabController.of(context)!..animation!.addListener(_listener);
    _scrollDirection = ScrollDirection.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();

    _controller.animation!.removeListener(_listener);
  }

  void _listener() {
    if (mounted) {
      context.dismissKeyboard();
      if (_scrollDirection.down) {
        _scrollDirection.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
