import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:coffieapp/view/login/login.view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "assets/icons/splash_screen.gif",
      splashIconSize: 500,
      backgroundColor: Colors.brown.shade100,
      nextScreen: LoginPage(),
    );
  }
}
