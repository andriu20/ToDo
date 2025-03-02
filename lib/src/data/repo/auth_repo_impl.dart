import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/data/datasource/auth_data_source.dart';
import 'package:todo/src/domain/entities/user_entity.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource dataSource;

  AuthRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, UserEntity?>> registerWithEmail(
      {required String email, required String password}) async {
    try {
      final result =
          await dataSource.registerWithEmail(email: email, password: password);
      return Right(result);
    } catch (e) {
      return Left(Failure("$e"));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> loginWithEmail(
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

  @override
  Future<Either<Failure, bool>> checkSession() async {
    try {
      final result = await dataSource.checkSession();
      return Right(result);
    } catch (e) {
      return Left(Failure("$e"));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await dataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
