import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/email_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/password_text_field.dart';
import 'package:to_do_app/Features/home/presentation/views/home_view.dart';
import 'package:to_do_app/core/utils/Functions/dialog_utils.dart';
import 'package:to_do_app/core/utils/firebase_error.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
            EmailTextField(
              onEmailEntered: (enteredEmail) {
                email = enteredEmail;
              },
            ),
            PasswordTextField(
              onPasswordEntered: (onPasswordEntered) {
                password = onPasswordEntered;
              },
            ),
            ElevatedButton(
              onPressed: () {
                login();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      DialogUtils.showLoadingDialog(context, 'Loading...');
      var userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigator.pushReplacementNamed(context, HomeView.routeName);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, 'User logged in successfully',
          isDismissible: false, posActionTitle: 'ok', posAction: () {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrorCode.userNotFound) {
        print('No user found');
      } else if (e.code == FirebaseErrorCode.wrongPassword) {
        print('Wrong Password ,please try again');
        {}
      }
    } catch (e) {
      print(e);
    }
  }
}
