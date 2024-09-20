import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_code/core/constants/constants.dart';
import 'package:flutter_boiler_code/core/router/data/router.dart';

@RoutePage()
class SplashPage extends StatelessWidget with AuthGuardMixin {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SPLASH',
          style: AppTextStyles.clashDisplay.s14,
        ),
      ),
    );
  }
}
