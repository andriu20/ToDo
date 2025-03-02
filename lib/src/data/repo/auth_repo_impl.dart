import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/data/datasource/auth_data_source.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource dataSource;

  AuthRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      final result =
          await dataSource.loginWithEmail(email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(Failure("$e"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> loginWithGoogle() async {
    try {
      final result = await dataSource.loginWithGoogle();
      return Right(result);
    } catch (e) {
      return Left(Failure("$e"));
    }
  }
}
