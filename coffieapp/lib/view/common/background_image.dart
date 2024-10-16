import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      left: 0,
      right: 0,
      top: 0,
      child:
          Image.asset("assets/images/coffee_beans_bg.jpg", fit: BoxFit.cover),
    );
  }
}
