import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomTitleDescriptionShow extends StatelessWidget {
  const CustomTitleDescriptionShow({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Styles.taskItem,
          ),
          Text(
            description,
          ),
        ],
      ),
    );
  }
}
