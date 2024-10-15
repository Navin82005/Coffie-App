import 'package:coffieapp/core/conf/app_config.dart';
import 'package:coffieapp/view/common/rounded_button.common.dart';
import 'package:flutter/material.dart';

class SubmitProduct extends StatefulWidget {
  const SubmitProduct({super.key});

  @override
  State<SubmitProduct> createState() => _SubmitProductState();
}

class _SubmitProductState extends State<SubmitProduct> {
  bool _hasHighPriority = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Checkbox(
                value: _hasHighPriority,
                onChanged: (value) => setState(() {
                  _hasHighPriority = !_hasHighPriority;
                }),
                side: const BorderSide(color: Color(0xFFECECEC)),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _hasHighPriority = !_hasHighPriority;
                }),
                child: AppTypography.Heading2(
                  text: "High Priority",
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(width: 5),
              Image.asset("assets/images/info-red.png", height: 15, width: 15)
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: RoundedRectButton(
              height: 50,
              onClick: () {},
              borderRadius: BorderRadius.circular(7.5),
              backgroundColor: const Color(0xFF359b4e),
              child: AppTypography.Heading2(text: "Submit"),
            ),
          )
        ],
      ),
    );
  }
}
