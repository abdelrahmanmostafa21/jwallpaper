import 'package:jwallpaper/src/app/presentations/root/model/main_tab_entry.dart';

enum DefaultMainTabEntriesKeys {
  home,
  fav,
  search,
}

/// The default entries for the `[MainTabView]` that determine the default
/// views in the home screen.
List<MainTabEntry> defaultMainTabEntries = <MainTabEntry>[
  MainTabEntry(
    id: DefaultMainTabEntriesKeys.home.name,
    icon: 'image',
    name: 'photos',
  ),
  MainTabEntry(
    id: DefaultMainTabEntriesKeys.fav.name,
    icon: 'heart',
    name: 'likes',
  ),
  MainTabEntry(
    id: DefaultMainTabEntriesKeys.search.name,
    icon: 'search',
    name: 'search',
  ),
];
