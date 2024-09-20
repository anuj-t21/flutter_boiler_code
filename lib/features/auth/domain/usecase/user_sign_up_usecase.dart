import 'package:dartz/dartz.dart';
import 'package:flutter_boiler_code/core/error/failure.dart';
import 'package:flutter_boiler_code/core/usecase/usecase.dart';
import 'package:flutter_boiler_code/shared/domain/entities/user.dart';
import 'package:flutter_boiler_code/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String password;
  final String email;

  UserSignUpParams({
    required this.name,
    required this.password,
    required this.email,
  });
}
