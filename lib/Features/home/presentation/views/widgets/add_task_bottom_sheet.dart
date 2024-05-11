import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/custom_text_form_field.dart';
import 'package:to_do_app/core/utils/colors.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            labelText: 'Task title',
          ),
          CustomTextFormField(
            labelText: 'Task description',
            maxLines: 4,
          ),
          Text(
            'Select Time',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.lightPrimaryColor),
          ),
        ],
      ),
    );
  }
}
