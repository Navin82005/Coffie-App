import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphicContainer extends StatelessWidget {
  final double borderRadius;
  final double height;
  final double width;
  final Color backgroundColor;
  final Border? border;
  final Widget? child;
  final ImageFilter imageFilter;
  final BorderRadius? borderRadiusBorder;

  const GlassMorphicContainer({
    super.key,
    this.height = double.maxFinite,
    this.width = double.maxFinite,
    this.borderRadius = 0,
    this.backgroundColor = Colors.transparent,
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
            color: Colors.white.withOpacity(0.1),
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
