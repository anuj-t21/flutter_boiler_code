import 'package:dartz/dartz.dart';
import 'package:flutter_boiler_code/core/error/failure.dart';
import 'package:flutter_boiler_code/shared/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> currentUser();
}
