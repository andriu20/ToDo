import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/src/core/shared/shared.dart';
import 'package:todo/src/domain/dto/task_dto.dart';

abstract class TaskDataSource {
  Future<bool> create(TaskDto dto);
}

class TaskDataSourceImpl implements TaskDataSource {
  final FirebaseFirestore firestore;

  TaskDataSourceImpl({required this.firestore});

  @override
  Future<bool> create(TaskDto dto) async {
    try {
      await firestore
          .collection('tasks')
          .doc(Shared.getUserModel.uid)
          .set(dto.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }
}
