import 'package:flutter_boiler_code/core/secrets/app_secrets.dart';
import 'package:flutter_boiler_code/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_boiler_code/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_boiler_code/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_boiler_code/features/auth/domain/usecase/current_user.dart';
import 'package:flutter_boiler_code/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:flutter_boiler_code/features/auth/domain/usecase/user_sign_up_usecase.dart';
import 'package:flutter_boiler_code/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_boiler_code/shared/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  //Init your Other Services Here
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnon,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  //Core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator
    //Data Source
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    //Repo
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    //Usecase
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    //Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
