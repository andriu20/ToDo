import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/presentation/gestor/login_cubit/login_cubit.dart';
import 'package:todo/src/presentation/widgets/btn_widget.dart';
import 'package:todo/src/presentation/widgets/input_widget.dart';

Widget formLoginView({required Size size}) =>
    BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final c = context.read<LoginCubit>();
        return Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                InputWidget.input(
                    controller: c.emailCtrl,
                    typeLine: TypeLine.line,
                    hintText: "Ej: example@gmail.com",
                    preffixIcon: Image.asset("assets/png/email.png"),
                    onChanged: (e) {
                      c.formValid();
                    }),
                SizedBox(height: size.height * .03),
                InputWidget.input(
                    controller: c.passwordController,
                    typeLine: TypeLine.line,
                    hintText: "******",
                    obscureText: !state.showPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          c.getEventShowPassword();
                        },
                        icon: Image.asset(state.showPassword
                            ? "assets/png/visible.png"
                            : "assets/png/visibility.png")),
                    preffixIcon: Image.asset("assets/png/lock.png"),
                    onChanged: (e) {}),
                SizedBox(height: size.height * .03),
                BtnWidget.btn(
                    onPressed: () {
                      c.login();
                    },
                    text: "Ingresar",
                    enabled: state.btnEbnabled)
              ],
            ),
          ),
        );
      },
    );
