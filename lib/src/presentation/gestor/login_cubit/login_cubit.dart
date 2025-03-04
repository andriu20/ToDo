import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/get_it.dart';
import 'package:todo/src/core/shared/shared.dart';
import 'package:todo/src/core/utils.dart';
import 'package:todo/src/data/model/user_model.dart';
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
    emit(state.copyWith(loading: true));
    final response = await authRepo.loginWithEmail(
        email: emailCtrl.text, password: passwordController.text);
    emit(state.copyWith(loading: false));

    response.fold((l) {}, (r) {
      if (sl<FirebaseAuth>().currentUser != null) {
        Shared.setUserModel = UserModel(
          uid: sl<FirebaseAuth>().currentUser!.uid,
          email: sl<FirebaseAuth>().currentUser!.email!,
        );
        goToHome();
      }
    });
  }

  void _checkSession() async {
    emit(state.copyWith(loading: true));
    final session = await authRepo.checkSession();

    emit(state.copyWith(loading: false));

    session.fold((l) {}, (r) {
      if (r) {
        goToHome();
      }
    });
  }

  ///Navegacion------------------------

  void goToRegister() => Navigator.pushNamed(state.context, "register");
  void goToHome() => Navigator.pushNamed(state.context, "home");

  ///Otros------------------------
}
