import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/auth.controller.dart';
import 'package:coffieapp/controller/userdata.controller.dart';

import 'package:coffieapp/view/common/background_image.dart';
import 'package:coffieapp/view/common/glass_morphic_container.common.dart';
import 'package:coffieapp/view/login/components/login_column.login.component.dart';

class LoginPage extends StatelessWidget {
  final Auth authController = Get.put(Auth());
  final userDataController = Get.put(UserDataController);
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
            child: GlassMorphicContainer(
              borderRadius: 17,
              border: Border.all(width: 1, color: Colors.white24),
              backgroundColor: Colors.white.withOpacity(.1),
              imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: LoginColumn(),
              ),
            ),
          ),
          GetX<Auth>(
            builder: (controller) {
              if (controller.isLoading.value) {
                return Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black54,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
