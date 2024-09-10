import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final String rating;
  final Color? color;
  final double? fontSize;
  const RatingWidget(
      {super.key, required this.rating, this.color, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating.split("|")[0],
          style: TextStyle(
            color: color,
            fontFamily: "Inter",
            fontSize: fontSize,
          ),
        ),
        Icon(Icons.star_rounded, color: Colors.yellow, size: fontSize),
        Text(
          "(${rating.split("|")[1]})",
          style: TextStyle(
            color: color,
            fontFamily: "Inter",
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
