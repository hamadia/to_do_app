import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/email_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/name_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/password_confirmation_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/password_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/user_name_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NameTextField(),
            UserNameTextField(),
            EmailTextField(),
            PasswordTextField(),
            PasswordConfirmationTextField(),
            ElevatedButton(
              onPressed: () {
                createAccount();
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
