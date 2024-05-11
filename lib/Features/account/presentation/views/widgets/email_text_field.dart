import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';
import '../../../../../core/utils/email_formate.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({super.key, required this.onEmailEntered});

  final TextEditingController emailController = TextEditingController();
  final void Function(String email) onEmailEntered;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      onChange: (email) {
        onEmailEntered(email!);
        return null;
      },
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
