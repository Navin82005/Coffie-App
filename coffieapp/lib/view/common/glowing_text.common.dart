import 'package:flutter/material.dart';

class GlowingText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final Color neonColor;
  final FontWeight? fontWeight;

  const GlowingText({
    super.key,
    required this.text,
    required this.neonColor,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: neonColor,
        shadows: [
          // Inner glow shadow
          Shadow(
            blurRadius: 10,
            color: neonColor!,
            offset: Offset(0, 0),
          ),
          // Outer glow shadow
          Shadow(
            blurRadius: 20,
            color: neonColor!.withOpacity(0.5),
            offset: Offset(0, 0),
          ),
          // Additional shadows for more intense glow
          Shadow(
            blurRadius: 30,
            color: neonColor!.withOpacity(0.3),
            offset: Offset(0, 0),
          ),
          Shadow(
            blurRadius: 40,
            color: neonColor!.withOpacity(0.1),
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
