import 'package:flutter/material.dart';

class BtnWidget {
  static Widget btn({
    required Function() onPressed,
    required String text,
    required bool enabled,
  }) =>
      ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(254, 239, 205, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Text(
          text,
          style: TextStyle(
            color:enabled? Colors.black:Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
