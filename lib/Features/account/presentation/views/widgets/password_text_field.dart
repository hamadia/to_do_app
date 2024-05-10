import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({super.key, required this.onPasswordEntered});

  final TextEditingController passwordController = TextEditingController();
  final void Function(String password) onPasswordEntered;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: passwordController,
          labelText: 'Password',
          onChange: (password) {
            onPasswordEntered(password!);
            return null;
          },
          validator: (input) {
            if (input == null || input.isEmpty) {
              return 'Please Enter Password';
            }
            if (input.length < 6) {
              return 'Password must be at least 6 character';
            }
            return null;
          },
        ),
        // PasswordConfirmationTextField(passwordController: passwordController),
      ],
    );
  }
}
