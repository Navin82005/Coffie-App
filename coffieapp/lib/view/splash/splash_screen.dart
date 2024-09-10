import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coffieapp/view/home/home.views.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "assets/icons/splash_screen.gif",
      splashIconSize: 500,
      animationDuration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.brown.shade200,
      nextScreen: const HomePage(),
    );
  }
}
