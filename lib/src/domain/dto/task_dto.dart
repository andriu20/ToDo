class TaskDto {
  final int id;
  final String tittle;
  final String descripcion;
  final bool completed;
  final DateTime date;

  TaskDto(
      {required this.id,
      required this.tittle,
      required this.descripcion,
      required this.completed,
      required this.date});
}
