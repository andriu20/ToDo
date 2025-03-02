import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/core/utils.dart';
import 'package:todo/src/domain/dto/task_dto.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ///Repositorios---------------------------
  ///Constructor---------------------------
  HomeCubit({required BuildContext context})
      : super(HomeState(context: context)) {
    emit(state.copyWith(taskDto: _taskDto));
  }

  ///Variables---------------------------

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  final List<TaskDto> _taskDto = [
    TaskDto(
        id: 1,
        tittle: "Titulo 1",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: true,
        date: DateTime.now()),
    TaskDto(
        id: 2,
        tittle: "Titulo 2",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 3,
        tittle: "Titulo 3",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 4,
        tittle: "Titulo 4",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 5,
        tittle: "Titulo 5",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 6,
        tittle: "Titulo 6",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 7,
        tittle: "Titulo 7",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 8,
        tittle: "Titulo 8",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 9,
        tittle: "Titulo 9",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now()),
    TaskDto(
        id: 10,
        tittle: "Titulo 10",
        descripcion:
            "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
        completed: false,
        date: DateTime.now())
  ];

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
  ///Navegacion---------------------------
  ///Otros---------------------------
}
