import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class TaskTitleTextField extends StatelessWidget {
  TaskTitleTextField({super.key, required this.onTitleEntered});

  final void Function(String title) onTitleEntered;
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChange: (title) {
        onTitleEntered(title!);
        return null;
      },
      controller: titleController,
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
