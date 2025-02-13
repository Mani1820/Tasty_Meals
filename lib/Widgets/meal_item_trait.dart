import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.lable,
  });

  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          lable,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
