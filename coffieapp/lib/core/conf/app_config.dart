import 'package:flutter/material.dart';

class AppTypography {
  static Text Heading1(
      {required String text, Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        color: color ?? const Color(0xFFCDCDCD),
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }

  static Text Heading2(
      {required String text, Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        color: color ?? const Color(0xFFCDCDCD),
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }

  static Text body2(
      {required String text, Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        color: color ?? const Color(0xFFCDCDCD),
        fontSize: 10,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
