part of '../router.dart';

class AppRouterObserverImpl extends AutoRouteObserver
    implements AppRouterObserver<TabPageRoute> {
  @override
  void didPush(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    log('Push Route: from ${previousRoute?.settings.name} -> to ${route.settings.name}');
  }

  @override
  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  }) {
    log('Replacing Route: from ${oldRoute?.settings.name} -> to ${newRoute?.settings.name}');
  }

  @override
  void didPop(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    log('Pop Route: from  ${route.settings.name} -> to ${previousRoute?.settings.name}');
  }

  @override
  void didChangeTabRoute(
    TabPageRoute route,
    TabPageRoute previousRoute,
  ) {
    log('Tab Route Switch: from  ${previousRoute.name} -> to ${route.name}');
  }

  @override
  void didInitTabRoute(
    TabPageRoute route,
    TabPageRoute? previousRoute,
  ) {
    log('Tab Route Init: ${route.name}');
  }
}
