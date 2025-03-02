import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/core/utils.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  ///Repositorios------------------------

  final AuthRepo authRepo;

  ///Constructor------------------------
  RegisterCubit({required BuildContext context, required this.authRepo})
      : super(RegisterState(context: context));

  ///Variables------------------------

  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordController = TextEditingController();
  final confPassController = TextEditingController();

  ///Eventos------------------------
  void getEventShowPassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  void getEventShowPasswordConf() {
    emit(state.copyWith(showPasswordConf: !state.showPasswordConf));
  }

  ///Validaciones------------------------

  void formValid() {
    bool e = false;
    if (nameCtrl.text.isNotEmpty &&
        lastNameCtrl.text.isNotEmpty &&
        emailCtrl.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confPassController.text.isNotEmpty &&
        confPassController.text == passwordController.text &&
        Utils.isValidEmail(emailCtrl.text)) {
      e = true;
    }
    emit(state.copyWith(btnEbnabled: e));
  }

  ///Peticiones------------------------
  void crearUsuario() async {
    log("----");
    await authRepo.registerWithEmail(
        email: emailCtrl.text, password: passwordController.text);
  }

  ///Navegacion------------------------

  ///Otros------------------------
}
