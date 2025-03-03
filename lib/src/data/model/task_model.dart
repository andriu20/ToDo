import 'package:todo/src/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.tittle,
    required super.descripcion,
    required super.completed,
    required super.date,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      tittle: json['tittle'],
      descripcion: json['descripcion'],
      completed: json['completed'],
      date: json['date'],
    );
  }
}
