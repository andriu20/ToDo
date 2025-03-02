import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/domain/dto/task_dto.dart';
import 'package:todo/src/presentation/gestor/home_cubit/home_cubit.dart';

Widget cardTodoHomeView({required Size size, required TaskDto dto}) =>
    BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          width: size.width,
          margin: EdgeInsets.symmetric(
            horizontal: size.width * .04,
            vertical: 5,
          ),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dto.tittle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * .02)),
                      SizedBox(width: 10),
                      Text(
                        dto.completed ? "Completada" : "Pendiente",
                        style: TextStyle(
                            color: dto.completed ? Colors.green : Colors.grey,
                            fontStyle: FontStyle.italic),
                      ),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                          onTap: () {
                            _dialogButtonShet(context);
                          },
                          child: Icon(Icons.more_vert_rounded))
                    ],
                  ),
                  Text(DateFormat("yMMMd").format(dto.date),
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      )),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "${dto.descripcion}    ",
                            ),
                            TextSpan(
                                text: "(Traducir)",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue))
                          ])),
                  SizedBox(height: 10),
                  Visibility(
                    visible: false,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion Descripcion",
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );

void _dialogButtonShet(BuildContext context) => showModalBottomSheet(
    context: context,
    builder: (_) => Container(
        margin: EdgeInsets.only(bottom: 30),
        child: ListTile(
          leading: Icon(Icons.check_box, color: Colors.green),
          title: Text("Finalizar"),
        )));
