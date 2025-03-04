import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> registerWithEmail(
      {required String email, required String password});
  Future<Either<Failure, void>> loginWithEmail(
      {required String email, required String password});
  Future<Either<Failure, dynamic>> loginWithGoogle();
  Future<Either<Failure, bool>> checkSession();
  Future<Either<Failure, void>> signOut();
}
