// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BuildContext context;
  final List<TaskEntity>? taskDto;
  late String statusSelected;
  late DateTime? date;
  late bool btnFormTask;
  late bool loading;
  late String taskId;
  HomeState({
    required this.context,
    this.taskDto,
    this.statusSelected = "T",
    this.date,
    this.btnFormTask = false,
    this.loading = false,
    this.taskId="",
  });

  @override
  List<Object?> get props => [
        context,
        taskDto,
        statusSelected,
        date,
        btnFormTask,
        loading,
        taskId,
      ];
  HomeState copyWith(
          {BuildContext? context,
          List<TaskEntity>? taskDto,
          String? statusSelected,
          DateTime? date,
          bool? loading,
          bool? btnFormTask,
          String? taskId}) =>
      HomeState(
          taskId: taskId ?? this.taskId,
          loading: loading ?? this.loading,
          context: context ?? this.context,
          btnFormTask: btnFormTask ?? this.btnFormTask,
          taskDto: taskDto ?? this.taskDto,
          statusSelected: statusSelected ?? this.statusSelected,
          date: date ?? this.date);
}
