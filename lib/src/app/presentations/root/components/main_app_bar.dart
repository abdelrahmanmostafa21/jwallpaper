import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_tab_bar.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/animations/index.dart';
import 'package:jwallpaper/src/core/widgets/app_tab/index.dart';
import 'package:jwallpaper/src/core/widgets/scroll/scroll_direction_listener.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  static double height(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.read<LayoutConfigCubit>().state;

    final systemPadding = config.bottomAppBar ? mediaQuery.padding.bottom : mediaQuery.padding.top;

    return AppTab.height(context) + systemPadding + 4;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.watch<LayoutConfigCubit>().state;

    final topPadding = config.bottomAppBar ? 0.0 : mediaQuery.padding.top + 4;
    final bottomPadding = config.bottomAppBar ? mediaQuery.padding.bottom + 4 : 0.0;

    final padding = EdgeInsets.only(
      top: topPadding,
      bottom: bottomPadding,
      left: config.paddingValue,
      right: config.paddingValue,
    );

    // since the sliver app bar does not work as intended with the nested
    // scroll view in the home tab view, we use an animated shifted position
    // widget and animate the app bar out of the view based on the scroll
    // position to manually hide / show the app bar
    return Align(
      alignment: config.bottomAppBar ? Alignment.bottomCenter : Alignment.topCenter,
      child: config.hideMainTabBar
          ? _DynamicAppBar(padding: padding)
          : _StaticAppBar(padding: padding),
    );
  }
}

class _DynamicAppBar extends StatelessWidget {
  const _DynamicAppBar({
    required this.padding,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final scrollDirection = ScrollDirection.of(context)!;
    final config = context.watch<LayoutConfigCubit>().state;

    return AnimatedShiftedPosition(
      shift: scrollDirection.direction == VerticalDirection.down
          ? config.bottomAppBar
              ? const Offset(0, 1)
              : const Offset(0, -1)
          : Offset.zero,
      child: MainTabBar(
        padding: padding,
      ),
    );
  }
}

class _StaticAppBar extends StatelessWidget {
  const _StaticAppBar({
    required this.padding,
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return MainTabBar(
      padding: padding,
    );
  }
}
