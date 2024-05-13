import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/colors.dart';
import 'package:to_do_app/core/utils/styles.dart';

class CustomIsDone extends StatelessWidget {
  const CustomIsDone({super.key, required this.onTap, required this.isDone});
  final void Function()? onTap;
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          decoration: BoxDecoration(
              color: isDone
                  ? AppColors.greenColor
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(18)),
          child: isDone
              ? Text(
                  'Done!',
                  style: Styles.title.copyWith(color: Colors.white),
                )
              : const Icon(
                  Icons.done,
                  color: Colors.white,
                  weight: 30,
                  size: 30,
                ),
        ));
  }
}
