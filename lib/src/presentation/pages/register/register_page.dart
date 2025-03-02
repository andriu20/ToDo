// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/get_it.dart';
import 'package:todo/src/presentation/gestor/register_cubit/register_cubit.dart';
import 'package:todo/src/presentation/pages/register/views/form_register_view.dart';
import 'package:todo/src/presentation/pages/register/views/google_btn_register_view.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => RegisterCubit(
        context: context,
        authRepo: sl(),
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              title: Text("Registro"),
              centerTitle: false,
              elevation: 8,
              backgroundColor: Color.fromRGBO(254, 239, 205, 1)),
          body: _body(),
        ),
      ),
    );
  }

  Widget _body() => Column(
        children: [
          formRegisterView(size: _size),
          SizedBox(height: 30),
          googleBtnRegisterView(),
        ],
      );
}
