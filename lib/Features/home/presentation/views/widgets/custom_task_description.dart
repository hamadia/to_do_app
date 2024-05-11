import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class TaskDescriptionTextField extends StatelessWidget {
  const TaskDescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Task description',
      maxLines: 4,
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please enter description';
        }
        return null;
      },
    );
  }
}
