import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class TaskTitleTextField extends StatefulWidget {
  const TaskTitleTextField({super.key, required this.onTitleEntered});

  final void Function(String title) onTitleEntered;

  @override
  State<TaskTitleTextField> createState() => _TaskTitleTextFieldState();
}

class _TaskTitleTextFieldState extends State<TaskTitleTextField> {
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onChange: (title) {
        widget.onTitleEntered(title!);
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

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    super.dispose();
  }
}
