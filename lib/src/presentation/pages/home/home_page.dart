// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/presentation/gestor/home_cubit/home_cubit.dart';
import 'package:todo/src/presentation/pages/home/views/card_todo_home_view.dart';
import 'package:todo/src/presentation/pages/home/views/chip_home_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(context: context),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(254, 239, 205, 1),
            elevation: 8,
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ),
          body: _body(),
        ),
      ),
    );
  }

  Widget _body() => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final c = context.read<HomeCubit>();
          return Column(
            children: [
              SizedBox(height: 20),
              ChipHomeView.chips(),
              SizedBox(height: 20),
              Expanded(
                  child: ListView.builder(
                      itemCount:
                          state.taskDto == null ? 0 : state.taskDto!.length,
                      itemBuilder: (_, i) => cardTodoHomeView(
                          size: _size, dto: state.taskDto![i])))
            ],
          );
        },
      );
}
