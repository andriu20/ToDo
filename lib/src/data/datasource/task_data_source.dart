import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/src/core/shared/shared.dart';
import 'package:todo/src/data/model/task_model.dart';
import 'package:todo/src/domain/dto/task_dto.dart';

enum TypeListEnum {
  all,
  pending,
  completed,
}

abstract class TaskDataSource {
  Future<bool> create(TaskDto dto);
  Future<List<TaskModel>> taskList(
      {required String userId, TypeListEnum tl = TypeListEnum.all});
}

class TaskDataSourceImpl implements TaskDataSource {
  final FirebaseFirestore firestore;

  TaskDataSourceImpl({required this.firestore});
  @override
  Future<bool> create(TaskDto dto) async {
    try {
      final userRef =
          firestore.collection('tasks').doc(Shared.getUserModel.uid);
      final tasksRef = userRef.collection('tasks');

      await tasksRef.doc(dto.id).set(dto.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<TaskModel>> taskList(
      {required String userId, TypeListEnum tl = TypeListEnum.all}) async {
    try {
      final querySnapshot = await firestore
          .collection('tasks')
          .doc(userId)
          .collection('tasks')
          .get();

      if (querySnapshot.docs.isEmpty) {
        return [];
      }

      return querySnapshot.docs.map((doc) {
        final taskData = doc.data();

        if (taskData['date'] is Timestamp) {
          taskData['date'] = (taskData['date'] as Timestamp).toDate();
        }

        return TaskModel.fromJson(taskData);
      }).where((task) {
        switch (tl) {
          case TypeListEnum.pending:
            return !task.completed;
          case TypeListEnum.completed:
            return task.completed;
          case TypeListEnum.all:
            return true;
        }
      }).toList();
    } catch (e) {
      if (kDebugMode) {
        log("Error obteniendo tareas: $e");
      }
      return [];
    }
  }
}
