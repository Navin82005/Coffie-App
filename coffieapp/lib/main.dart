import 'package:coffieapp/core/meta/app_data.dart';
import 'package:coffieapp/view/home/home.views.dart';
// import 'package:coffieapp/view/unknown/unknown_page.unknown.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // initialRoute: "/home",
      getPages: [
        // GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/home", page: () => const HomePage()),
      ],
      // unknownRoute: GetPage(name: "/", page: () =>  UnknownPage()),
      // home: const SplashScreen(),
      home: const HomePage(),
      // home: ProductPage(
      //   Beverage(
      //     name: "Lattè",
      //     description:
      //         "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
      //     oneLiner: "Espresso, Steamed Milk",
      //     rating: "4.9|458",
      //     imagePath: "assets/images/latte.png",
      //     isVeg: true,
      //   ),
      // ),
    );
  }
}
