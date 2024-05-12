import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/colors.dart';

class CustomLineSide extends StatelessWidget {
  const CustomLineSide({super.key, required this.isDone});

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 80,
      decoration: BoxDecoration(
        color: isDone ? AppColors.greenColor : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }
}
