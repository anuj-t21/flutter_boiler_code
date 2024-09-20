import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boiler_code/core/router/data/router.dart';
part 'haptics/haptics.dart';

class AppServices {
  AppServices._();
  static final BuildContext currentContext =
      router.navigatorKey.currentContext!;
  static final AppRouterImpl router = AppRouterImpl();
  static final AppHaptic haptics = AppHaptic._();
}
