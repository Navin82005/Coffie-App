import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController textEditingController;

  final String? hintText;

  final Color? hintColor;
  final Color? borderColor;
  final Color? cursorColor;

  final String? hintFont;

  final double? hintSize;

  const FormTextField({
    super.key,
    required this.textEditingController,
    this.hintText,
    this.hintFont,
    this.hintColor = Colors.white,
    this.hintSize = 14,
    this.borderColor = Colors.white,
    this.cursorColor = Colors.white60,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: TextStyle(
        color: hintColor,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        fillColor: cursorColor,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: hintSize,
        ),
        hoverColor: cursorColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 19,
        ),
        border: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: borderColor!)),
      ),
    );
  }
}
