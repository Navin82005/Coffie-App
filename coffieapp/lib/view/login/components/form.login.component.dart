import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/auth.controller.dart';

import 'package:coffieapp/view/common/text_field.common.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          FormTextField(
            hintText: "User Name",
            hintFont: "Inter",
            textEditingController: Get.find<Auth>().nameFieldController,
          ),
          const SizedBox(height: 14),
          FormTextField(
            hintText: "Password",
            hintFont: "Inter",
            textEditingController: Get.find<Auth>().passwordFieldController,
          ),
        ],
      ),
    );
  }
}
