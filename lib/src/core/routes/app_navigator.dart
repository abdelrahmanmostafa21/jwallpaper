import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/root/root_screen.dart';
import 'package:jwallpaper/src/core/routes/transitions/app_page_route.dart';
import 'package:jwallpaper/src/core/routes/transitions/fade_route.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('AppNavigator');

/// Determines what [PageRoute] is used for the new route.
///
/// This determines the transition animation for the new route.
enum RouteType {
  defaultRoute,
  fullScreen,
  fade,
}

/// A [Navigator] observer that is used to notify [RouteAware]s of changes to
/// the state of their [Route].
final appRouteObserver = RouteObserver<ModalRoute<dynamic>>();

/// The [AppNavigator] contains the [Navigator] key used by the root
/// [MaterialApp].
///
/// This allows for navigation without access to the [BuildContext].
// TODO: refactor and make use of flutter's navigator 2.0
class AppNavigator {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  NavigatorState get state => key.currentState!;

  void pop<T extends Object>([T? result]) => state.pop<T>(result);

  Future<bool> maybePop<T extends Object>([T? result]) => state.maybePop(result);

  Future<T?> push<T>(Route<T> route) => state.push<T>(route);

  void popToMain<T>() => state.popUntil((route) => route.isFirst);

  void pushReplacementNamed(
    String route, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    state.pushReplacementNamed<void, void>(
      route,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }

  Future pushNamed(
    String route, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    return state.pushNamed(
      route,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }
}

/// [onGenerateRoute] is called whenever a new named route is being pushed to
/// the app.
///
/// The [RouteSettings.arguments] that can be passed along the named route
/// needs to be a `Map<String, dynamic>` and can be used to pass along
/// arguments for the screen.
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;

  _log.fine('navigating to $routeName');

  final arguments = settings.arguments as Map<String, dynamic>? ?? <String, dynamic>{};

  final routeType = arguments['routeType'] as RouteType? ?? RouteType.defaultRoute;

  Widget screen;

  switch (routeName) {
    case RootScreen.route:
      screen = const RootScreen();
      break;
    default:
      _log.warning('route does not exist; navigating to login screen instead');
      screen = const SizedBox();
  }

  switch (routeType) {
    case RouteType.fade:
      return FadeRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    case RouteType.defaultRoute:
      return AppPageRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    case RouteType.fullScreen:
      return AppPageRoute(
        builder: (_) => screen,
        fullscreenDialog: true,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
  }
}
