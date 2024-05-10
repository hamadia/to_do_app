import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class UserNameTextField extends StatelessWidget {
  UserNameTextField({super.key, required this.onUserNameEntered});

  final TextEditingController userNameController = TextEditingController();
  final void Function(String fullName) onUserNameEntered;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: userNameController,
      onChange: (userName) {
        onUserNameEntered(userName!);
        return null;
      },
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
