import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

typedef OnPressed = void Function();

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});

  final OnPressed onPressed;
  final String title;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: Styles.add,
      ),
    );
  }
}
