import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/view/home/home.views.dart';

class Auth extends GetxController {
  var isLoading = false.obs;
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  loginWithEmail() async {
    isLoading.value = true;
    await Future.delayed(
        const Duration(seconds: 2)); // To simulate the login API call
    if (nameFieldController.text == "swiftcafeuser@gmail.com" &&
        passwordFieldController.text == "swiftcafeuser@password") {
      Get.offAll(const HomePage());
    } else {
      Get.snackbar(
        "Error",
        "Invalid username or password!",
        duration: const Duration(seconds: 3),
      );
    }
    isLoading.value = false;
  }
}
