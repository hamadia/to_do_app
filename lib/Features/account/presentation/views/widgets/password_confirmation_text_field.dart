import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';

class PasswordConfirmationTextField extends StatelessWidget {
  PasswordConfirmationTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordConfirmationController,
      labelText: 'Password Confirmation',
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please Enter Password';
        }
        if (passwordConfirmationController.text != passwordController.text) {
          return 'Not the same password';
        }
        return null;
      },
    );
  }
}
