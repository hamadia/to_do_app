import 'package:flutter/material.dart';

import '../../../../../core/utils/email_formate.dart';
import 'custom_text_form_field.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      labelText: 'Email',
      validator: (input) {
        if (input == null || input.isEmpty) {
          return 'Please Enter Email';
        }
        if (!isEmailValid(input)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}
