import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class TaskDescriptionTextField extends StatelessWidget {
  TaskDescriptionTextField({super.key, required this.onDescriptionEntered});

  final void Function(String description) onDescriptionEntered;
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: descriptionController,
      onChange: (description) {
        onDescriptionEntered(description!);
        return null;
      },
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
