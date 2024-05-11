import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class TaskTitleTextField extends StatelessWidget {
  const TaskTitleTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Task title',
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please enter description';
        }
        return null;
      },
    );
  }
}
