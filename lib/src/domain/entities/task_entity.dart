import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String tittle;
  final String descripcion;
  final String translatedText;
  final bool completed;
  final DateTime date;

  const TaskEntity({
    required this.id,
    required this.tittle,
    required this.descripcion,
    required this.translatedText,
    required this.completed,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        tittle,
        descripcion,
        completed,
        date,
        translatedText
      ];
  TaskEntity copyWith({
    String? id,
    String? tittle,
    String? translatedText,
    String? descripcion,
    bool? completed,
    DateTime? date,
  }) =>
      TaskEntity(
        translatedText:translatedText ?? this.translatedText,
        id: id ?? this.id,
        tittle: tittle ?? this.tittle,
        descripcion: descripcion ?? this.descripcion,
        completed: completed ?? this.completed,
        date: date ?? this.date,
      );
}
