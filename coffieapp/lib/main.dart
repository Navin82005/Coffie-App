import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/core/meta/app_data.dart';

import 'package:coffieapp/view/home/home.views.dart';
import 'package:coffieapp/view/login/login.view.dart';
import 'package:coffieapp/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppData.AppName,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/home", page: () => const HomePage()),
      ],
      home: const SplashScreen(),
      // home: const HomePage(),
    );
  }
}
