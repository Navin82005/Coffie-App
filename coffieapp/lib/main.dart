import 'package:coffieapp/model/userdata.model.dart';
import 'package:coffieapp/view/home/home.views.dart';
import 'package:coffieapp/view/login/login.view.dart';
import 'package:coffieapp/view/splash/splash_screen.dart';
// import 'package:coffieapp/view/unknown/unknown_page.unknown.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swift Café',
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/home", page: () => HomePage()),
      ],
      // unknownRoute: GetPage(name: "/", page: () =>  UnknownPage()),
      home: const SplashScreen(),
    );
  }
}
