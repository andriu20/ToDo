import 'package:flutter/material.dart';

enum TypeLine {
  border,
  line,
}

class InputWidget {
  static Widget input({
    required TextEditingController controller,
    required Function(String) onChanged,
    TypeLine typeLine = TypeLine.border,
    bool obscureText = false,
    String? hintText,
    Widget? preffixIcon,
    Widget? suffixIcon,
  }) =>
      TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: preffixIcon,
          suffixIcon: suffixIcon,
          border: _getBorder(typeLine),
          enabledBorder: _getBorder(typeLine, isEnabled: true),
          focusedBorder: _getBorder(typeLine, isFocused: true),
        ),
      );

  static InputBorder _getBorder(TypeLine type,
      {bool isEnabled = false, bool isFocused = false}) {
    Color color = isFocused
        ? Colors.blue
        : (isEnabled ? Colors.grey : Colors.transparent);

    return type == TypeLine.border
        ? OutlineInputBorder(borderSide: BorderSide(color: color))
        : UnderlineInputBorder(borderSide: BorderSide(color: color));
  }
}
