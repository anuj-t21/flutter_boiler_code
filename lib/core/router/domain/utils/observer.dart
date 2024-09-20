part of '../router.dart';

abstract class AppRouterObserver<TabRoute> {
  //TODO:should be of type AppRouterObserver
  static final AppRouterObserverImpl instance = AppRouterObserverImpl();

  void didPush(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  );

  void didReplace({
    Route<dynamic>? newRoute,
    Route<dynamic>? oldRoute,
  });

  void didPop(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  );

  void didChangeTabRoute(
    TabRoute route,
    TabRoute previousRoute,
  );

  void didInitTabRoute(
    TabRoute route,
    TabRoute? previousRoute,
  );
}
