import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/core/shared/shared.dart';
import 'package:todo/src/core/utils.dart';
import 'package:todo/src/data/datasource/task_data_source.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/domain/entities/task_entity.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';
import 'package:todo/src/domain/repository/task_dto.dart';
import 'package:uuid/uuid.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ///Repositorios---------------------------
  ///
  final TaskRepo taskRepo;
  final AuthRepo authRepo;

  ///Constructor---------------------------
  HomeCubit({required BuildContext context, required this.taskRepo, required this.authRepo})
      : super(HomeState(context: context)) {
    _taskList();
  }

  ///Variables---------------------------

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  ///Eventos---------------------------
  void getEventFilterTask(String v) {
    emit(state.copyWith(taskDto: [], statusSelected: v));

    _taskList(
        tl: v == "P"
            ? TypeListEnum.pending
            : v == "C"
                ? TypeListEnum.completed
                : TypeListEnum.all);
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
  ///
  void _taskList({TypeListEnum tl = TypeListEnum.all}) async {
    emit(state.copyWith(loading: true));
    final response =
        await taskRepo.taskList(userId: Shared.getUserModel.uid, tl: tl);
    emit(state.copyWith(loading: false));
    response.fold((l) {}, (r) {
      Utils.showSnackbar(
        state.context,
        r.isEmpty
            ? "No hay tareas por listar."
            : "Consulta realizada con éxito.",
        isError: r.isEmpty,
      );

      emit(state.copyWith(taskDto: r));
    });
  }

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
      Utils.showSnackbar(
        state.context,
        r ? "Tarea creada éxito." : "No fue posible crear la tarea.",
        isError: !r,
      );
      if (r) {
        _taskList();
      }
    });
  }

  void updateTask(TaskEntity e) async {
    emit(state.copyWith(loading: true));
    final response = await taskRepo.updateTaskCompletion(
      userId: Shared.getUserModel.uid,
      taskId: e.id,
      completed: true,
    );
    response.fold((l) {}, (r) {
      Utils.showSnackbar(
        state.context,
        r ? "Tarea actualizada éxito." : "No fue posible actualizar la tarea.",
        isError: !r,
      );
      _taskList();
    });
    emit(state.copyWith(loading: false));
  }

  void deletTask(TaskEntity e) async {
    emit(state.copyWith(loading: true));
    final response = await taskRepo.deleteTask(
      userId: Shared.getUserModel.uid,
      taskId: e.id,
    );
    response.fold((l) {}, (r) {
      Utils.showSnackbar(
        state.context,
        r ? "Tarea eliminada éxito." : "No fue posible eliminar la tarea.",
        isError: !r,
      );
      _taskList();
    });
    emit(state.copyWith(loading: false));
  }

  void singOut() async {
    await authRepo.signOut();
    goLogin();
  }

  ///Navegacion---------------------------
  void goLogin() => Navigator.pushNamed(state.context, "login");
  ///Otros---------------------------
}
