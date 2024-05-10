import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/custom_text_form_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/password_text_field.dart';

class PasswordConfirmationTextField extends StatelessWidget {
  PasswordConfirmationTextField({super.key});

  final TextEditingController passwordConfirmationController =
      TextEditingController();
  PasswordTextField? passwordTextField;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordConfirmationController,
      labelText: 'Password Confirmation',
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please Enter Password';
        }
        if (input.length < 6) {
          return 'Password must be at least 6 character';
        }
        if (input != passwordTextField?.passwordController.text) {
          return 'Not the same password';
        }
        return null;
      },
    );
  }
}
