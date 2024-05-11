import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const StadiumBorder(
        side: BorderSide(
          width: 4,
          color: Colors.white,
        ),
      ),
      child: const Icon(Icons.add),
    );
  }

  onPressed() {}
}
