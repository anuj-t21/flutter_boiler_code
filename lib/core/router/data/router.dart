import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_boiler_code/core/extensions/extensions.dart';
import 'package:flutter_boiler_code/core/router/domain/router.dart';
import 'package:flutter_boiler_code/shared/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart' as ir;

part 'utils/guards/auth.dart';
part 'utils/guards/splash.dart';
part 'utils/observer.dart';

class AppRouterImpl extends ir.AppRouter
    implements AppRouter<PageRouteInfo<dynamic>> {
  @override
  AppRouterImpl() : super();

  // @override
  // Future<void> bootUp() {
  //   // TODO: implement bootUp
  //   throw UnimplementedError();
  // }

  // @override
  // void onBootUp() {
  //   // TODO: implement onBootUp
  // }

  // @override
  // void bootDown() {}

  void onDeepLink(DeepLink deepLink) {}

  void onPushNotification(Map data) {}
}
