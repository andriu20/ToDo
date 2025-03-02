import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/presentation/gestor/home_cubit/home_cubit.dart';
import 'package:todo/src/presentation/widgets/input_widget.dart';

Widget formLoginViewtaskView() => BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final c = context.read<HomeCubit>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InputWidget.input(
              controller: c.titleCtrl,
              onChanged: (e) {
                c.formTaskValid();
              },
              hintText: "Titulo",
            ),
            SizedBox(height: 10),
            InputWidget.input(
              controller: c.descriptionCtrl,
              lines: 4,
              onChanged: (e) {
                c.formTaskValid();
              },
              hintText: "Descripción",
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                c.getEventDate();
              },
              child: Row(
                children: [
                  Icon(Icons.calendar_month),
                  SizedBox(width: 10),
                  Text(state.date == null
                      ? "Fecha limite"
                      : DateFormat("yMMMd").format(state.date!)),
                ],
              ),
            ),
          ],
        );
      },
    );
