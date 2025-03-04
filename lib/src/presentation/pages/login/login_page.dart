// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/get_it.dart';
import 'package:todo/src/presentation/gestor/login_cubit/login_cubit.dart';
import 'package:todo/src/presentation/pages/login/views/form_login_view.dart';
import 'package:todo/src/presentation/pages/login/views/logo_login_view.dart';
import 'package:todo/src/presentation/widgets/loading_widget.dart';

import 'views/txt_login_view.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: BlocProvider(
      create: (context) => LoginCubit(context: context, authRepo: sl()),
      child: Scaffold(body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Stack(
            children: [
              _body(),
              Visibility(
                visible: state.loading,
                child: LoadingWidget(),
              )
            ],
          );
        },
      )),
    ));
  }

  Widget _body() => BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final c = context.read<LoginCubit>();
          return Column(
            children: [
              SizedBox(height: _size.height * .06),
              logoLoginView(size: _size),
              SizedBox(height: _size.height * .05),
              txtLoginView(size: _size),
              formLoginView(size: _size),
              SizedBox(height: _size.height * .02),
              Text("Tambien puedes ingresar con:"),
              SizedBox(height: _size.height * .02),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      c.goToRegister();
                    },
                    child: Text(
                      "Crear cuenta",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )),
              ),
            ],
          );
        },
      );
}
