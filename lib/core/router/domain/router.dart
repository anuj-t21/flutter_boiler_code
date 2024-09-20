import 'package:flutter/material.dart';
import 'package:flutter_boiler_code/core/router/data/router.dart';

part 'utils/observer.dart';
part 'utils/guard.dart';

abstract class AppRouter<I> {
  // static final AppRouterImpl instance = AppRouterImpl();

  //TODO: handle deeplink and push notification nav
  // void onDeepLink(DeepLink deepLink);
  //
  // void onPushNotification(AppPushNotification pushNotification);
}
