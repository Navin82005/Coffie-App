import 'package:coffieapp/controller/auth.contoller.dart';
import 'package:coffieapp/view/common/text_field.common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
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
