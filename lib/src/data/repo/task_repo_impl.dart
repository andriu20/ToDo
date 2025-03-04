import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/data/datasource/task_data_source.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/entities/task_entity.dart';
import 'package:todo/src/domain/repository/task_dto.dart';

class TaskRepoImpl implements TaskRepo {
  final TaskDataSource dataSource;

  TaskRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, bool>> create({required TaskDto dto}) async {
    try {
      final r = await dataSource.create(dto);
      return Right(r);
    } catch (e) {
      if (kDebugMode) {
        log("$e");
      }
      return Left(Failure("$e"));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> taskList(
      {required String userId, TypeListEnum tl = TypeListEnum.all}) async {
    try {
      final r = await dataSource.taskList(userId: userId, tl: tl);
      return Right(r);
    } catch (e) {
      if (kDebugMode) {
        log("$e -");
      }
      return Left(Failure("$e"));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTaskCompletion(
      {required String userId,
      required String taskId,
      required bool completed}) async {
    try {
      final r = await dataSource.updateTaskCompletion(
        userId: userId,
        taskId: taskId,
        completed: completed,
      );
      return Right(r);
    } catch (e) {
      if (kDebugMode) {
        log("$e -");
      }
      return Left(Failure("$e"));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(
      {required String userId, required String taskId}) async {
    try {
      final r = await dataSource.deleteTask(
        userId: userId,
        taskId: taskId,
      );
      return Right(r);
    } catch (e) {
      if (kDebugMode) {
        log("$e -");
      }
      return Left(Failure("$e"));
    }
  }
}
