import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity?>> registerWithEmail(
      {required String email, required String password});
  Future<Either<Failure, UserEntity?>> loginWithEmail(
      {required String email, required String password});
  Future<Either<Failure, dynamic>> loginWithGoogle();
  Future<Either<Failure, bool>> checkSession();
  Future<Either<Failure, void>> signOut();
}
