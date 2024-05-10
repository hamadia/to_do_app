import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/email_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/name_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/password_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/user_name_text_field.dart';
import 'package:to_do_app/core/utils/firebase_error.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;

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
            EmailTextField(
              onEmailEntered: (enteredEmail) {
                email = enteredEmail;
              },
            ),
            PasswordAndPasswordConfirmationTextField(
              onPasswordEntered: (onPasswordEntered) {
                password = onPasswordEntered;
              },
            ),
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

  void createAccount() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrorCode.weakPassword) {
        print('The password provided is too weak');
      } else if (e.code == FirebaseErrorCode.emailAlreadyInUse) {
        print('the account is already exist');
        {}
      }
    } catch (e) {
      print(e);
    }
  }
}
