import 'package:flutter/material.dart';

class CustomAppBar {
  static PreferredSizeWidget build() {
    return AppBar(
      toolbarHeight: 0,
      backgroundColor: Colors.black,
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }
}
