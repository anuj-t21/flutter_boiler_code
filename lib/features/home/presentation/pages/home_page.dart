import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_code/core/constants/constants.dart';
import 'package:flutter_boiler_code/core/utils/screen_util/screen_util.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.paddingScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Text(
              'Welcome to EdHub!',
              style: AppTextStyles.clashDisplay.s40.w6,
            ),
          ],
        ),
      ),
    );
  }
}
