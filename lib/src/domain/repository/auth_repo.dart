import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/domain/entities/registro_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegistrEontity?>> registerWithEmail(
      {required String email, required String password});
  Future<Either<Failure, dynamic>> loginWithEmail(
      {required String email, required String password});
  Future<Either<Failure, dynamic>> loginWithGoogle();
}
