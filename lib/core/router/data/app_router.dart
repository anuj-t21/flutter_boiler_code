import 'package:auto_route/auto_route.dart';
import 'package:flutter_boiler_code/core/router/data/router.dart';
import 'package:flutter_boiler_code/core/router/data/utils/path/route_path.dart';
import 'package:flutter_boiler_code/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_boiler_code/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_boiler_code/features/home/presentation/pages/home_page.dart';
import 'package:flutter_boiler_code/features/splash/presentation/pages/splash_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        //AUTH
        AutoRoute(
          path: RoutePath.loginPage,
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: RoutePath.signUpPage,
          page: SignUpRoute.page,
        ),

        //HOME
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          guards: const [
            SplashGuard(),
            AuthGuard(),
          ],
        ),

        //SHARED
        AutoRoute(
          path: RoutePath.splashPage,
          page: SplashRoute.page,
        ),
      ];
}
