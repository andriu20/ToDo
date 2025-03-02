import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/domain/dto/user_dto.dart';

abstract class UserRepo {
  Future<Either<Failure, bool>> crearUsuario({required UserDto dto});
}
