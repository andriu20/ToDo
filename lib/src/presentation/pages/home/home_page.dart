// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:todo/get_it.dart';
import 'package:todo/src/presentation/gestor/home_cubit/home_cubit.dart';
import 'package:todo/src/presentation/pages/home/views/card_todo_home_view.dart';
import 'package:todo/src/presentation/pages/home/views/chip_home_view.dart';
import 'package:todo/src/presentation/pages/home/views/form_new_task_view.dart';
import 'package:todo/src/presentation/widgets/loading_widget.dart';

import '../../widgets/speed_dial_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            HomeCubit(context: context, taskRepo: sl(), authRepo: sl()),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final c = context.read<HomeCubit>();
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(254, 239, 205, 1),
                elevation: 8,
                automaticallyImplyLeading: false,
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Stack(
                children: [
                  _body(),
                  Visibility(visible: state.loading, child: LoadingWidget())
                ],
              ),
              floatingActionButton: _option(context, c),
            );
          },
        ),
      ),
    );
  }

  Widget _body() => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 20),
              ChipHomeView.chips(),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: state.taskDto == null ? 0 : state.taskDto!.length,
                  itemBuilder: (_, i) => cardTodoHomeView(
                    size: _size,
                    dto: state.taskDto![i],
                  ),
                ),
              )
            ],
          );
        },
      );

  void _addNewTask({required BuildContext context, required HomeCubit cubit}) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final c = context.read<HomeCubit>();
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: Text("Añadir nueva tarea"),
                content: formLoginViewtaskView(),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.red),
                      )),
                  TextButton(
                      onPressed: state.btnFormTask
                          ? () {
                              c.taskCreate();
                            }
                          : null,
                      child: Text(
                        "Crear",
                        style: TextStyle(
                          color: state.btnFormTask ? Colors.green : Colors.grey,
                        ),
                      )),
                ],
              );
            },
          ),
        ),
      );

  Widget _option(BuildContext context, HomeCubit c) => SpeedDial(children: [
        speedDialWidget(
          Icons.add,
          'Crear tarea',
          () {
            _addNewTask(context: context, cubit: c);
          },
        ),
        speedDialWidget(
          Icons.exit_to_app,
          'Cerrar sesión',
          () {
            c.singOut();
          },
        ),
      ], child: const Icon(Icons.add));
}
