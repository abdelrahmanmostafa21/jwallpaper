import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_tab_view.dart';
import 'package:jwallpaper/src/app/presentations/root/components/will_pop_app.dart';
import 'package:jwallpaper/src/app/presentations/root/view_model/main_tab_view_model.dart';
import 'package:jwallpaper/src/core/widgets/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/scroll/scroll_direction_listener.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  static const route = 'root';

  @override
  Widget build(BuildContext context) {
    return WillPopApp(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainTabViewModel()),
        ],
        child: Builder(
          builder: (_) => const ScrollDirectionListener(
            depth: 1,
            child: AppScaffold(
              shouldRemoveFocus: true,
              body: MainTabView(),
            ),
          ),
        ),
      ),
    );
  }
}
