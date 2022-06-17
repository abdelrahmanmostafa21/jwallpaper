// ignore: implementation_imports
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_tab_entry_icon.dart';
import 'package:jwallpaper/src/app/presentations/root/model/main_tab_entry.dart';
import 'package:jwallpaper/src/app/presentations/root/view_model/main_tab_view_model.dart';
import 'package:jwallpaper/src/config/theme/index.dart';
import 'package:jwallpaper/src/core/widgets/app_tab/index.dart';

import 'package:provider/provider.dart';

/// Builds the tab bar with the tabs for the main screen.
class MainTabBar extends StatelessWidget {
  const MainTabBar({
    required this.padding,
    Key? key,
  }) : super(key: key);

  final EdgeInsets padding;

  Widget _mapEntryTabs(MainTabEntry entry, AppTheme theme) => _DefaultTab(entry: entry);

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    final model = context.watch<MainTabViewModel>();

    return AppTabBar(
      padding: padding,
      tabs: [
        const _SettingsTab(),
        for (MainTabEntry entry in model.visibleEntries) _mapEntryTabs(entry, appTheme),
      ],
      endWidgets: const [],
    );
  }
}

//**************************************************************** */

class _DefaultTab extends StatelessWidget {
  const _DefaultTab({
    required this.entry,
  });

  final MainTabEntry entry;
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return AppTab(
      icon: MainTabEntryIcon(entry.icon),
      text: entry.checkName ? Text(entry.name!) : null,
      cardColor: appTheme.alternateCardColor,
      selectedCardColor: appTheme.primaryColor,
      selectedForegroundColor: appTheme.onPrimary,
    );
  }
}

//**************************************************************** */

class _SettingsTab extends StatelessWidget {
  const _SettingsTab();

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return AppTab(
      cardColor: appTheme.alternateCardColor,
      selectedCardColor: appTheme.primaryColor,
      selectedForegroundColor: appTheme.onPrimary,
      icon: const RotatedBox(
        quarterTurns: 1,
        child: Icon(EvaIcons.settings),
      ),
    );
  }
}
