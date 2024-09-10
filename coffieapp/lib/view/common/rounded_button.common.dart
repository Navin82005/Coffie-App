import 'package:flutter/material.dart';

class RoundedRectButton extends StatelessWidget {
  final Widget child;
  final Function onClick;
  final Gradient? gradient;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Border? border;
  final List<BoxShadow>? boxShadow;

  const RoundedRectButton({
    super.key,
    required this.child,
    required this.onClick,
    this.gradient,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(0),
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onClick(),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          border: border,
          color: backgroundColor,
          gradient: gradient,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: padding!,
          child: Center(child: child),
        ),
      ),
    );
  }
}
