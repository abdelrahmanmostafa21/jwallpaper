import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_app_bar.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:provider/provider.dart';

/// Top padding for content in the `[MainTabView]`.
class MainTopPadding extends StatelessWidget {
  const MainTopPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.watch<LayoutConfigCubit>().state;

    if (!config.bottomAppBar) {
      return SizedBox(height: MainAppBar.height(context));
    } else {
      return SizedBox(height: mediaQuery.padding.top);
    }
  }
}

class MainTopSliverPadding extends StatelessWidget {
  const MainTopSliverPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: MainTopPadding(),
    );
  }
}

/// Bottom padding for content in the `[MainTabView]`.
class MainBottomPadding extends StatelessWidget {
  const MainBottomPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final config = context.watch<LayoutConfigCubit>().state;

    if (config.bottomAppBar) {
      return SizedBox(height: MainAppBar.height(context));
    } else {
      return SizedBox(height: mediaQuery.padding.bottom);
    }
  }
}

class MainBottomSliverPadding extends StatelessWidget {
   const MainBottomSliverPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: MainBottomPadding(),
    );
  }
}
