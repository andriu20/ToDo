import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, dynamic>> loginWithEmail(
      {required String email, required String password});
  Future<Either<Failure, dynamic>> loginWithGoogle();
}
