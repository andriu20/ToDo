// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BuildContext context;
  final List<TaskDto>? taskDto;
  late String statusSelected;
  late DateTime? date;
  late bool btnFormTask;
  HomeState(
      {required this.context,
      this.taskDto,
      this.statusSelected = "T",
      this.date,
      this.btnFormTask=false,
      });

  @override
  List<Object?> get props => [context, taskDto, statusSelected, date,btnFormTask];
  HomeState copyWith(
          {BuildContext? context,
          List<TaskDto>? taskDto,
          String? statusSelected,
          DateTime? date,
          bool? btnFormTask
          }) =>
      HomeState(
          context: context ?? this.context,
          btnFormTask: btnFormTask ?? this.btnFormTask,
          taskDto: taskDto ?? this.taskDto,
          statusSelected: statusSelected ?? this.statusSelected,
          date: date ?? this.date);
}
