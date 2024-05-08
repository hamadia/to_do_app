import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class NameTextField extends StatelessWidget {
  NameTextField({super.key});

  final TextEditingController fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: fullNameController,
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
