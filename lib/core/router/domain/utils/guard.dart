part of '../router.dart';

abstract class AppRouterGuard<R, StackRouter> {
  void onNavigation(R resolver, StackRouter router);
}
