import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/core/utils.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ///Repositorios------------------------
  ///Constructor------------------------

  LoginCubit({required BuildContext context})
      : super(LoginState(context: context));

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
  ///Navegacion------------------------

  void goToRegister() => Navigator.pushNamed(state.context, "register");

  ///Otros------------------------
}
