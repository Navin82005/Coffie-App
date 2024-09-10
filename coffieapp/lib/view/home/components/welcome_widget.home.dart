import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  final String date;
  final String username;

  const WelcomeWidget({
    super.key,
    required this.date,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/vectors/hai.png", height: 30, width: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFB6B6B6),
                          letterSpacing: .2,
                        ),
                      ),
                      Text(
                        username,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFB6B6B6),
                          letterSpacing: .2,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => print("appbar bin button pressed"),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9F9F9).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/vectors/bin_icon.png",
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            "assets/vectors/user_icon.png",
            height: 40,
            width: 40,
          )
        ],
      ),
    );
  }
}
