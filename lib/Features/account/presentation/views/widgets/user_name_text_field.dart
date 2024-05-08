import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class UserNameTextField extends StatelessWidget {
  UserNameTextField({super.key});

  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: userNameController,
      labelText: 'User Name',
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please Enter user name';
        }
        return null;
      },
    );
  }
}
