class TaskDto {
  final String tittle;
  final String id;
  final String descripcion;
  final bool completed;
  final DateTime date;

  TaskDto(
      {required this.tittle,
      required this.id,
      required this.descripcion,
      required this.completed,
      required this.date});

  Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "descripcion": descripcion,
        "completed": completed,
        "date": date,
        "id":id
      };
}
