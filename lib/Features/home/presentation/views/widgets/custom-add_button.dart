import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

typedef OnPressed = void Function();

class CustomAddButton extends StatefulWidget {
  const CustomAddButton({super.key, required this.onPressed});

  final OnPressed onPressed;

  @override
  State<CustomAddButton> createState() => _CustomAddButtonState();
}

class _CustomAddButtonState extends State<CustomAddButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        'Add Task',
        style: Styles.add,
      ),
    );
  }
}
