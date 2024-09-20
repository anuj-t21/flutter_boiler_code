part of '../../router.dart';

class SplashGuard extends AutoRouteGuard
    implements AppRouterGuard<NavigationResolver, StackRouter> {
  const SplashGuard();
  static final Completer<void> _initServicesCompleter = Completer();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // Await for all services to be initialised / booted up

    // Uncomment this line to wait for initial services -- remember to withdraw the guard
    // await _initServicesCompleter.future;
    router.replace(const ir.SplashRoute());
    resolver.next();
  }
}

mixin SplashGuardMixin {
  void withdrawInitServicesGuard() async {
    final initServicesCompleter = SplashGuard._initServicesCompleter;

    if (initServicesCompleter.isCompleted.not) {
      initServicesCompleter.complete();
    }
  }
}
