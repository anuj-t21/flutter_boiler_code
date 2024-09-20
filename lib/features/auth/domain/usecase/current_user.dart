import 'package:dartz/dartz.dart';
import 'package:flutter_boiler_code/core/error/failure.dart';
import 'package:flutter_boiler_code/core/usecase/usecase.dart';
import 'package:flutter_boiler_code/shared/domain/entities/user.dart';
import 'package:flutter_boiler_code/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
