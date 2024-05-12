import 'package:flutter/material.dart';

class CustomLineSide extends StatelessWidget {
  const CustomLineSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }
}
