import 'package:flutter/material.dart';

class Adder extends StatelessWidget {
  final VoidCallback? onTap;
  const Adder({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: const Color(0xFF66A35C),
          borderRadius: BorderRadius.circular(2),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            size: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
