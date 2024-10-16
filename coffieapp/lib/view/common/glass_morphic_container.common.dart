import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphicContainer extends StatelessWidget {
  final ImageFilter imageFilter;
  final double borderRadius;
  final double height;
  final double width;

  final Border? border;
  final Widget? child;
  final Color? backgroundColor;
  final BorderRadius? borderRadiusBorder;

  const GlassMorphicContainer({
    super.key,
    this.height = double.maxFinite,
    this.width = double.maxFinite,
    this.borderRadius = 0,
    this.backgroundColor,
    this.border,
    this.child,
    required this.imageFilter,
    this.borderRadiusBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: imageFilter,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white.withOpacity(0.1),
            borderRadius:
                borderRadiusBorder ?? BorderRadius.circular(borderRadius),
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
