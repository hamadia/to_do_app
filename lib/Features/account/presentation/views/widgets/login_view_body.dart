import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/account/presentation/manager/register_and_login_provider.dart';
import 'package:to_do_app/Features/account/presentation/views/register_view.dart';
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
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterView.routeName);
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    var authProvider = Provider.of<MyAuthProvider>(context, listen: false);
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      DialogUtils.showLoadingDialog(context, 'Loading...');
      await authProvider.login(email, password);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, 'User logged in successfully',
          isDismissible: false, posActionTitle: 'ok', posAction: () {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrorCode.userNotFound ||
          e.code == FirebaseErrorCode.wrongPassword) {
        DialogUtils.hideDialog(context);
        DialogUtils.showMessage(context, 'Wrong email or password',
            posActionTitle: 'ok');
      }
    } catch (e) {
      DialogUtils.showMessage(context, 'Something went wrong',
          posActionTitle: 'ok');
    }
  }
}
