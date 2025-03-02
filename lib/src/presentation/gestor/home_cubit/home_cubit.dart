import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/core/utils.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/repository/task_dto.dart';
import 'package:uuid/uuid.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ///Repositorios---------------------------
  ///
  final TaskRepo taskRepo;

  ///Constructor---------------------------
  HomeCubit({required BuildContext context, required this.taskRepo})
      : super(HomeState(context: context)) {
    emit(state.copyWith(taskDto: _taskDto));
  }

  ///Variables---------------------------

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  final List<TaskDto> _taskDto = [];

  ///Eventos---------------------------
  void getEventFilterTask(String v) {
    emit(state.copyWith(taskDto: _taskDto, statusSelected: v));
    final list = state.taskDto ?? [];
    List<TaskDto> listTem = [];

    emit(state.copyWith(taskDto: []));
    for (var i in list) {
      if (v == "T") {
        listTem.add(i);
      }
      if (v == "C") {
        if (i.completed) {
          listTem.add(i);
        }
      }
      if (v == "P") {
        if (!i.completed) {
          listTem.add(i);
        }
      }
    }
    emit(state.copyWith(taskDto: listTem));
  }

  void getEventDate() async {
    final date = await Utils.selectDate(state.context);
    if (date != null) {
      emit(state.copyWith(date: date));
      formTaskValid();
    }
  }

  ///Validaciones---------------------------

  void formTaskValid() {
    bool e = false;
    if (descriptionCtrl.text.isNotEmpty &&
        titleCtrl.text.isNotEmpty &&
        state.date != null) {
      e = true;
    }
    emit(state.copyWith(btnFormTask: e));
  }

  ///Peticiones---------------------------

  void taskCreate() async {
    Navigator.pop(state.context);
    emit(state.copyWith(loading: true));
    final response = await taskRepo.create(
        dto: TaskDto(
      tittle: titleCtrl.text,
      id: Uuid().v4(),
      descripcion: descriptionCtrl.text,
      completed: false,
      date: state.date!,
    ));
    emit(state.copyWith(loading: false));

    response.fold((l) {}, (r) {
      if (r) {}
    });
  }

  ///Navegacion---------------------------
  ///Otros---------------------------
}
