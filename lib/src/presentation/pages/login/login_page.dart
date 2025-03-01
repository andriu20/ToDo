// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/presentation/gestor/login_cubit/login_cubit.dart';
import 'package:todo/src/presentation/pages/login/views/form_login_view.dart';
import 'package:todo/src/presentation/pages/login/views/google_btn_login_view.dart';
import 'package:todo/src/presentation/pages/login/views/logo_login_view.dart';

import 'views/txt_login_view.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  late Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: BlocProvider(
      create: (context) => LoginCubit(context: context),
      child: Scaffold(body: _body()),
    ));
  }

  Widget _body() => Column(
        children: [
          SizedBox(height: _size.height * .09),
          logoLoginView(size: _size),
          SizedBox(height: _size.height * .05),
          txtLoginView(size: _size),
          formLoginView(size: _size),
          SizedBox(height: _size.height * .02),
          googleBtnloginView(),
          SizedBox(height: _size.height * .02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Crear cuenta",
                  style: TextStyle(decoration: TextDecoration.underline),
                )),
          )
        ],
      );
}
