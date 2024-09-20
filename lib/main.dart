import 'package:auto_route/auto_route.dart';
import 'package:flutter_boiler_code/core/router/data/router.dart';
import 'package:flutter_boiler_code/core/router/domain/router.dart';
import 'package:flutter_boiler_code/core/services/app_services.dart';
import 'package:flutter_boiler_code/core/theme/theme.dart';
import 'package:flutter_boiler_code/core/utils/screen_util/screen_util.dart';
import 'package:flutter_boiler_code/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_boiler_code/init_dependencies.dart';
import 'package:flutter_boiler_code/shared/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<AppUserCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AuthGuardMixin {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    context.read<AuthBloc>().add(AuthCurrentUser());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: false,
      splitScreenMode: false,
      ensureScreenSize: true,
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Boiler Code',
          theme: AppTheme.darkThemeMode,
          routerDelegate: AutoRouterDelegate(
            AppServices.router,
            navigatorObservers: () => [
              AppRouterObserver.instance,
              // Can add more router observer
            ],
          ),
          routeInformationParser: AppServices.router.defaultRouteParser(),
        );
      },
    );
  }
}
