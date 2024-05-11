import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class FullNameTextField extends StatelessWidget {
  FullNameTextField({super.key, required this.onNameEntered});

  final TextEditingController fullNameController = TextEditingController();
  final void Function(String fullName) onNameEntered;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: fullNameController,
      onChange: (fullName) {
        onNameEntered(fullName!);
        return null;
      },
      labelText: 'Full Name',
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please Enter Your Name';
        }
        return null;
      },
    );
  }
}
