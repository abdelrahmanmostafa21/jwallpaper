import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/root/model/default_main_tab_entries.dart';
import 'package:jwallpaper/src/app/presentations/root/model/main_tab_entry.dart';
import 'package:jwallpaper/src/config/developer/index.dart';

class MainTabViewModel extends ValueNotifier<List<MainTabEntry>> with AppLogger {
  MainTabViewModel() : super(defaultMainTabEntries);

  /// The entries that are visibl in the main screen.
  List<MainTabEntry> get visibleEntries => value.where((entry) => entry.visible!).toList();
}
