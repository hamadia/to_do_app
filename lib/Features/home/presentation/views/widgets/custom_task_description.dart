import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class TaskDescriptionTextField extends StatefulWidget {
  const TaskDescriptionTextField(
      {super.key, required this.onDescriptionEntered});

  final void Function(String description) onDescriptionEntered;

  @override
  State<TaskDescriptionTextField> createState() =>
      _TaskDescriptionTextFieldState();
}

class _TaskDescriptionTextFieldState extends State<TaskDescriptionTextField> {
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: descriptionController,
      onChange: (description) {
        widget.onDescriptionEntered(description!);
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

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}
