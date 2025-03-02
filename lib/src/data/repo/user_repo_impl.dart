import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/data/datasource/user_data_source.dart';
import 'package:todo/src/domain/dto/user_dto.dart';
import 'package:todo/src/domain/repository/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final UserDataSource userDataSource;

  UserRepoImpl({required this.userDataSource});
  @override
  Future<Either<Failure, dynamic>> crearUsuario({required UserDto dto}) async {
    try {
      final result = await userDataSource.crearUsuario(dto: dto);
      return Right(result);
    } catch (e) {
      return Left(Failure("$e"));
    }
  }
}
