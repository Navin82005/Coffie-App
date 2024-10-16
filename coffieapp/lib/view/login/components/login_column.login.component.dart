import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/auth.controller.dart';

import 'package:coffieapp/view/common/glowing_text.common.dart';
import 'package:coffieapp/view/common/rounded_button.common.dart';
import 'package:coffieapp/view/login/components/form.login.component.dart';

class LoginColumn extends StatelessWidget {
  const LoginColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset("assets/vectors/icon.png", height: 90, width: 90),
        renderSwiftCafeText(),
        const Spacer(),
        const GlowingText(
          text: "\"Latte but never late\"",
          neonColor: Color(0xFFABABAB),
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: LoginForm(),
        ),
        const Spacer(),
        ...renderButtons(),
        const Spacer(),
        const Text(
          "Privacy Policy",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget renderSwiftCafeText() => const Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: "Swift\n",
          style: TextStyle(
            fontFamily: "Raleway",
            fontSize: 64,
            fontWeight: FontWeight.w600,
            height: 1.2,
            color: Color(0xFFFFFFFF),
          ),
          children: [
            TextSpan(
              text: "Café",
              style: TextStyle(
                fontFamily: "Raleway",
                fontSize: 40,
                fontWeight: FontWeight.w400,
                height: 1.2,
                color: Color(0xFFFFFFFF),
              ),
            )
          ],
        ),
      );

  List<Widget> renderButtons() => [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: RoundedRectButton(
            onClick: () => Get.find<Auth>().loginWithEmail(),
            padding: const EdgeInsets.symmetric(vertical: 12.5),
            backgroundColor: Colors.amber,
            boxShadow: const [
              BoxShadow(
                spreadRadius: -2,
                color: Color(0xA6000000),
                blurRadius: 15,
                offset: Offset(2, 2),
              )
            ],
            gradient: const LinearGradient(
              colors: [Color(0xFF4D2B1A), Color(0xFFA7745A)],
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: RoundedRectButton(
            // ignore: avoid_print
            onClick: () => print("Logged in!"),
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 0),
            border: Border.all(width: 1, color: const Color(0xFFF8F8F8)),
            child: const Text(
              "SignUp",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ];
}
