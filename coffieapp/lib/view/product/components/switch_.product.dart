import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'package:coffieapp/controller/beverage.controller.dart';

class ChoiceSwitch extends StatefulWidget {
  final String text;
  final BeverageController controller;
  const ChoiceSwitch({super.key, required this.text, required this.controller});

  @override
  State<ChoiceSwitch> createState() => _ChoiceSwitchState();
}

class _ChoiceSwitchState extends State<ChoiceSwitch> {
  bool switchState = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AdvancedSwitch(
            height: 15,
            width: 25,
            initialValue: false,
            onChanged: (value) => setState(() {
              switchState = value;
            }),
            borderRadius: BorderRadius.circular(20),
            activeChild: Container(
              color: const Color(0xFF51E068),
            ),
            inactiveChild: Container(
              color: const Color(0xFFBABABA),
            ),
            activeColor: const Color(0xFF51E068),
            inactiveColor: const Color(0xFFBABABA),
            thumb: switchState
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(width: 2, color: const Color(0xFFFFFFFF)),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF238544),
                          Color(0xFF51E068),
                        ],
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(width: 2, color: const Color(0xFFFFFFFF)),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFBABABA),
                          Color(0xFF5B5B5B),
                        ],
                      ),
                    ),
                  ),
          ),
          const SizedBox(width: 10),
          Text(
            widget.text,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w300,
              fontSize: 14,
              color: Color(0xFFCDCDCD),
            ),
          ),
        ],
      ),
    );
  }
}
