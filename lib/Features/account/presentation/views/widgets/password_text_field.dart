import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({super.key});

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      labelText: 'Password',
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please Enter Password';
        }
        if (input.length < 6) {
          return 'Password must be at least 6 character';
        }
        if (input != passwordController.text) {
          return 'Not the same password';
        }
        return null;
      },
    );
  }
}
