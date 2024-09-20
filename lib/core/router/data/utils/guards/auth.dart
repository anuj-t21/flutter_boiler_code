part of '../../router.dart';

class AuthGuard extends AutoRouteGuard
    implements AppRouterGuard<NavigationResolver, StackRouter> {
  const AuthGuard();
  static final Completer<void> _authDataCompleter = Completer();

  static Completer<void>? _onLogInSuccessful;

  static Completer<void>? _onLogOutSuccessful;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    await _authDataCompleter.future;
    final context = router.navigatorKey.currentContext;
    final bool isAuthenticated =
        (context?.read<AppUserCubit>().state) is AppUserLoggedIn;

    if (isAuthenticated.not) {
      _onLogInSuccessful = Completer();
      resolver.redirect(const ir.LoginRoute());
      await _onLogInSuccessful?.future;
    }
    resolver.next(true);
    _onLogOutSuccessful = Completer();
    await _onLogOutSuccessful?.future;
    resolver.redirect(const ir.LoginRoute());
  }
}

mixin AuthGuardMixin {
  void withdrawAuthDataGuard() async {
    final authDataCompleter = AuthGuard._authDataCompleter;

    if (authDataCompleter.isCompleted.not) {
      authDataCompleter.complete();
    }
  }

  void withdrawAuthLoginGuard() async {
    final authLoginCompleter = AuthGuard._onLogInSuccessful;

    if (authLoginCompleter?.isCompleted.not ?? false) {
      authLoginCompleter?.complete();
    }
  }

  void withdrawAuthLogoutGuard() async {
    final authLogoutCompletor = AuthGuard._onLogOutSuccessful;

    if (authLogoutCompletor?.isCompleted.not ?? false) {
      authLogoutCompletor?.complete();
    }
  }
}
