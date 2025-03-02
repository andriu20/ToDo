import 'package:dartz/dartz.dart';
import 'package:todo/src/core/failure/failure.dart';
import 'package:todo/src/data/datasource/task_data_source.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
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
      print(e);
      return Left(Failure("$e"));
    }
  }
}
