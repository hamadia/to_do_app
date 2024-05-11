import 'package:flutter/material.dart';

import '../../../../../core/utils/common_widget/custom_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.onPasswordEntered});

  final void Function(String password) onPasswordEntered;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController passwordController = TextEditingController();

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: passwordController,
          labelText: 'Password',
          obscureText: obscureText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          ),
          onChange: (password) {
            widget.onPasswordEntered(password!);
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
