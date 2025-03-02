
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/src/core/utils.dart';
import 'package:todo/src/domain/dto/user_dto.dart';
import 'package:todo/src/domain/repository/auth_repo.dart';
import 'package:todo/src/domain/repository/user_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  ///Repositorios------------------------

  final AuthRepo authRepo;
  final UserRepo userRepo;

  ///Constructor------------------------
  RegisterCubit(
      {required BuildContext context,
      required this.authRepo,
      required this.userRepo})
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
  void crearCuenta() async {
    final registro = await authRepo.registerWithEmail(
        email: emailCtrl.text, password: passwordController.text);
    registro.fold((l) {}, (r) {
      _crearUsuario(r!.uid);
    });
  }

  void _crearUsuario(String id) async {
    await userRepo.crearUsuario(
        dto: UserDto(
      id: id,
      name: nameCtrl.text,
      lastName: lastNameCtrl.text,
      email: emailCtrl.text,
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
    ));
  }

  ///Navegacion------------------------

  ///Otros------------------------
}
