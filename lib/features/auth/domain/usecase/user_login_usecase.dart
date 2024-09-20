import 'package:dartz/dartz.dart';
import 'package:flutter_boiler_code/core/error/failure.dart';
import 'package:flutter_boiler_code/core/usecase/usecase.dart';
import 'package:flutter_boiler_code/shared/domain/entities/user.dart';
import 'package:flutter_boiler_code/features/auth/domain/repository/auth_repository.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;
  const UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String password;
  final String email;

  UserLoginParams({
    required this.password,
    required this.email,
  });
}
