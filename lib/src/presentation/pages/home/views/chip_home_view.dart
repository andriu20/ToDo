import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/domain/dto/item_chip_dto.dart';
import 'package:todo/src/presentation/gestor/home_cubit/home_cubit.dart';

class ChipHomeView {
  static final List<ItemChipDto> _items = [
    ItemChipDto(title: "Todos", value: "T"),
    ItemChipDto(title: "Completados", value: "C"),
    ItemChipDto(title: "Pendientes", value: "P"),
  ];

  static Widget chips() => BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final c = context.read<HomeCubit>();
          return SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: _items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    c.getEventFilterTask(_items[i].value);
                  },
                  child: Chip(
                    backgroundColor: state.statusSelected == _items[i].value
                        ? Colors.black
                        : Colors.white,
                    label: Text(
                      _items[i].title,
                      style: TextStyle(
                          color: state.statusSelected != _items[i].value
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
