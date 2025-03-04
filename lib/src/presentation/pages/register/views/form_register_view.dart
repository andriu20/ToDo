import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/presentation/gestor/register_cubit/register_cubit.dart';
import 'package:todo/src/presentation/widgets/btn_widget.dart';
import 'package:todo/src/presentation/widgets/input_widget.dart';

Widget formRegisterView({required Size size}) =>
    BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final c = context.read<RegisterCubit>();
        return Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(height: size.height * .06),
                InputWidget.input(
                    controller: c.nameCtrl,
                    typeLine: TypeLine.line,
                    hintText: "Nombres",
                    preffixIcon: Image.asset("assets/png/man.png"),
                    onChanged: (e) {
                      c.formValid();
                    }),
                SizedBox(height: size.height * .03),
                InputWidget.input(
                    controller: c.lastNameCtrl,
                    typeLine: TypeLine.line,
                    hintText: "Apellidos",
                    preffixIcon: Image.asset("assets/png/man.png"),
                    onChanged: (e) {
                      c.formValid();
                    }),
                SizedBox(height: size.height * .03),
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
                    hintText: "Contraseña",
                    obscureText: !state.showPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          c.getEventShowPassword();
                        },
                        icon: Image.asset(state.showPassword
                            ? "assets/png/visible.png"
                            : "assets/png/visibility.png")),
                    preffixIcon: Image.asset("assets/png/lock.png"),
                    onChanged: (e) {
                      c.formValid();
                    }),
                SizedBox(height: size.height * .03),
                InputWidget.input(
                    controller: c.confPassController,
                    typeLine: TypeLine.line,
                    hintText: "Confimar contraseña",
                    obscureText: !state.showPasswordConf,
                    suffixIcon: IconButton(
                        onPressed: () {
                          c.getEventShowPasswordConf();
                        },
                        icon: Image.asset(state.showPasswordConf
                            ? "assets/png/visible.png"
                            : "assets/png/visibility.png")),
                    preffixIcon: Image.asset("assets/png/lock.png"),
                    onChanged: (e) {
                      c.formValid();
                    }),
                SizedBox(height: size.height * .09),
                BtnWidget.btn(
                    onPressed: () {
                      c.crearCuenta();
                    },
                    text: "Crear cuenta",
                    enabled: state.btnEbnabled)
              ],
            ),
          ),
        );
      },
    );
