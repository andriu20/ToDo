import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/core/utils.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ///Repositorios------------------------
  ///
  final AuthRepo authRepo;

  ///Constructor------------------------

  LoginCubit({required BuildContext context, required this.authRepo})
      : super(LoginState(context: context)) {
    _checkSession();
  }

  ///Variables------------------------

  final emailCtrl = TextEditingController();
  final passwordController = TextEditingController();

  ///Eventos------------------------
  void getEventShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  ///Validaciones------------------------

  void formValid() {
    bool e = false;
    if (emailCtrl.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        Utils.isValidEmail(emailCtrl.text)) {
      e = true;
    }
    emit(state.copyWith(btnEbnabled: e));
  }

  ///Peticiones------------------------

  void login() async {
    final response = await authRepo.loginWithEmail(
        email: emailCtrl.text, password: passwordController.text);

    response.fold((l) {}, (r) {
      if (r!.email.isNotEmpty) {
        goToHome();
      }
    });
  }

  void _checkSession() async {
    final session = await authRepo.checkSession();
    session.fold((l) {}, (r) {
      goToHome();
    });
  }

  ///Navegacion------------------------

  void goToRegister() => Navigator.pushNamed(state.context, "register");
  void goToHome() => Navigator.pushNamed(state.context, "home");

  ///Otros------------------------
}
