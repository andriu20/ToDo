import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/data/datasource/task_data_source.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/entities/task_entity.dart';

abstract class TaskRepo {
  Future<Either<Failure, bool>> create({required TaskDto dto});

  Future<Either<Failure, List<TaskEntity>>> taskList(
      {required String userId, TypeListEnum tl = TypeListEnum.all});

  Future<Either<Failure, bool>> updateTaskCompletion(
      {required String userId,
      required String taskId,
      required bool completed});
}
