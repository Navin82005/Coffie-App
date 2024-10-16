import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiSearchBar extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;

  final Color? hintColor;
  final Color? color;
  final Color? backgroundColor;

  final double? hintFontSize;
  final double? fontSize;
  final double? height;
  final double? width;

  final EdgeInsets? contentPadding;
  final BorderRadius? borderRadius;
  final FontWeight? fontWeight;

  final Border? border;

  const UiSearchBar({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintColor,
    this.hintFontSize = 12,
    this.height = 15,
    this.width = double.infinity,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 10),
    this.borderRadius,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w300,
    this.color,
    this.backgroundColor = const Color(0xFFF9F9F9),
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: Row(
        children: [
          Image.asset("assets/icons/search.png", height: 18, width: 18),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: fontWeight,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: contentPadding,
                hintStyle: TextStyle(
                  fontSize: hintFontSize,
                  color: hintColor,
                  fontFamily: "Inter",
                  fontWeight: fontWeight,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Image.asset("assets/icons/filter.png", height: 18, width: 18),
        ],
      ),
    );
  }
}
