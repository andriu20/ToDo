// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BuildContext context;
  final List<TaskDto>? taskDto;
  late String statusSelected;
  HomeState({
    required this.context,
    this.taskDto,
    this.statusSelected = "T",
  });

  @override
  List<Object?> get props => [context, taskDto, statusSelected];
  HomeState copyWith(
          {BuildContext? context,
          List<TaskDto>? taskDto,
          String? statusSelected}) =>
      HomeState(
        context: context ?? this.context,
        taskDto: taskDto ?? this.taskDto,
        statusSelected: statusSelected ?? this.statusSelected,
      );
}
