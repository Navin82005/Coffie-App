import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedRectButton extends StatelessWidget {
  final Widget child;
  final Function onClick;
  final Gradient? gradient;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  final Border? border;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  final double? height;
  final double? width;

  const RoundedRectButton({
    super.key,
    required this.child,
    required this.onClick,
    this.gradient,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(0),
    this.border,
    this.boxShadow,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onClick(),
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
      ),
      child: Container(
        height: height,
        width: width ?? Get.width,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          border: border,
          color: backgroundColor,
          gradient: gradient,
          borderRadius: borderRadius ?? BorderRadius.circular(30),
        ),
        child: Padding(
          padding: padding!,
          child: Center(child: child),
        ),
      ),
    );
  }
}
