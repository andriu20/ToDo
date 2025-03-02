import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/domain/dto/task_dto.dart';

abstract class TaskRepo {
  Future<Either<Failure, bool>> create({required TaskDto dto});
}
