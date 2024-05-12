import 'package:flutter/material.dart';

class CustomIsDone extends StatelessWidget {
  const CustomIsDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(18)),
      child: const Icon(
        Icons.done,
        color: Colors.white,
        weight: 30,
        size: 30,
      ),
    );
  }
}
