import 'package:flutter/material.dart';

class CustomContainerTaskDesign extends StatelessWidget {
  const CustomContainerTaskDesign({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
