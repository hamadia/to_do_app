import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/colors.dart';

import '../../../../../core/utils/styles.dart';

class CustomTitleDescriptionShow extends StatelessWidget {
  const CustomTitleDescriptionShow({
    super.key,
    required this.title,
    required this.description,
    required this.isDone,
  });

  final String title;
  final String description;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: isDone
                ? Styles.taskItem.copyWith(color: AppColors.greenColor)
                : Styles.taskItem,
          ),
          Text(
            description,
          ),
        ],
      ),
    );
  }
}
