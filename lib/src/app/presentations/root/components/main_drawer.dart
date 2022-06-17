import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_content_padding.dart';
import 'package:jwallpaper/src/config/constants/index.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/utils/shared/url_launcher.dart';
import 'package:jwallpaper/src/core/widgets/animations/misc/index.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/misc/index.dart';
import 'package:provider/provider.dart';

/// A fullscreen-sized navigation drawer for the [`MainTabView]`.
///
/// Entries are animated dynamically based on the animation in the tab view.
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.watch<LayoutConfigCubit>().state;

    return _DrawerAnimationListener(
      builder: (context) {
        final animationController = context.watch<AnimationController>();

        return ListView(
          padding: config.edgeInsets,
          children: [
            const MainTopPadding(),
            verticalSpacer,
            _Entries(animationController),
            const MainBottomPadding(),
          ],
        );
      },
    );
  }
}

class _DrawerAnimationListener extends StatefulWidget {
  const _DrawerAnimationListener({
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  _DrawerAnimationListenerState createState() => _DrawerAnimationListenerState();
}

class _DrawerAnimationListenerState extends State<_DrawerAnimationListener>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _tabController = DefaultTabController.of(context)!;
    _tabController.animation!.addListener(_tabControllerListener);
  }

  @override
  void dispose() {
    _tabController.animation!.removeListener(_tabControllerListener);
    _controller.dispose();

    super.dispose();
  }

  void _tabControllerListener() {
    if (mounted) {
      final value = 1 - _tabController.animation!.value;

      if (value >= 0 && value <= 1 && value != _controller.value) {
        _controller.value = value;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => _controller,
      child: Builder(builder: widget.builder),
    );
  }
}

class _Entries extends StatelessWidget {
  const _Entries(this.controller);

  final AnimationController controller;

  List<Widget> _animate(List<Widget> children) {
    final animated = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      final offsetAnimation = Tween<Offset>(
        begin: Offset(lerpDouble(-.3, -2, i / children.length)!, 0),
        end: Offset.zero,
      ).animate(controller);

      animated.add(
        ShiftedPosition(
          shift: offsetAnimation.value,
          child: Opacity(
            opacity: controller.value,
            child: children[i],
          ),
        ),
      );
    }

    return animated;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    final textTheme = theme.textTheme;
    final color = textTheme.bodyText2!.color;

    final linkStyle = TextStyle(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    final children = [
      verticalSpacer,
      Card(
        child: Column(
          children: [
            AppListTile(
              leading: const Icon(Icons.history),
              title: Text(
                'version 1.0.0',
                style: theme.textTheme.subtitle1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: kRadius,
                topRight: kRadius,
              ),
            ),
            AppListTile(
              leading: const Icon(EvaIcons.link),
              title: const Text('Demo Wallpapers app'),
              subtitle: Text(
                '''
🔒 made as a task for josequal company 🤓
this app is made with flutter.
using pexels api to fetch wallpapers.
this app will be as a tutorial on github to help developers learn flutter
             ''',
                style: linkStyle,
              ),
              onTap: () => launchUrl('https://www.linkedin.com/in/abdelrahman-mostafa21/'),
            ),
          ],
        ),
      ),
      verticalSpacer,
      AppListCard(
        leading: const Icon(EvaIcons.email),
        subtitle: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'this app is made with love by '),
              TextSpan(
                text: 'abdelrahmn mostafa ',
                style: linkStyle.copyWith(
                  color: Colors.amberAccent,
                ),
              ),
              TextSpan(
                text: 'tap to open my linked-in profile',
                style: linkStyle,
              ),
            ],
          ),
        ),
        onTap: () => launchUrl('https://www.linkedin.com/in/abdelrahman-mostafa21/'),
      ),
      verticalSpacer,
      const AppListCard(
        leading: Icon(EvaIcons.book),
        title: Text('cahngelog of current: 1.0.0'),
        subtitle: Text(
          '''
- get images from pexels api
- download / save iamge with HQ resolution
- Custom themes logic
- provider state management
- animations
- custom widgets
- local storage (SharedPrefs)
          ''',
        ),
      ),
      verticalSpacer,
      const AppListCard(
        leading: Icon(EvaIcons.syncOutline),
        title: Text('next backlog'),
        subtitle: Text(
          '''
- add more sources to fetch wallpapers
- add more themes and let the user control and change the theme as its needs
- filter wallpapers / collections / search results
- make the layout more flexible and let the user update what he like
- add videos to the app
- Firebase Auth / storage and let the user add/update on his profile
- color picker to filter
- test, ui test & code coverage
  ... and more features will be added.
          ''',
        ),
      ),
      verticalSpacer,
    ];

    return Column(
      children: _animate(children),
    );
  }
}
