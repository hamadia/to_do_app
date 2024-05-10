import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/data/model/user.dart' as myuser;
import 'package:to_do_app/Features/account/data/user_dao.dart';
import 'package:to_do_app/Features/account/presentation/views/login_view.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/email_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/name_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/password_text_field.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/user_name_text_field.dart';
import 'package:to_do_app/core/utils/Functions/dialog_utils.dart';
import 'package:to_do_app/core/utils/firebase_error.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String fullName;
  late String userName;

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
            FullNameTextField(
              onNameEntered: (enteredName) {
                fullName = enteredName;
              },
            ),
            UserNameTextField(
              onUserNameEntered: (enteredUserName) {
                userName = enteredUserName;
              },
            ),
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
      DialogUtils.showLoadingDialog(context, 'Loading...');
      var credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await UserDao.addUser(myuser.User(
        id: credential.user?.uid,
        fullName: fullName,
        userName: userName,
        email: email,
      ));
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(
        context,
        'Registered successfully',
        posActionTitle: 'ok',
        posAction: () {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        },
      );
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == FirebaseErrorCode.weakPassword) {
        DialogUtils.showMessage(context, 'The password provided is too weak',
            posActionTitle: 'ok');
      } else if (e.code == FirebaseErrorCode.emailAlreadyInUse) {
        DialogUtils.showMessage(context, 'the account is already exist',
            posActionTitle: 'ok');
      }
    } catch (e) {
      DialogUtils.showMessage(context, e.toString(), posActionTitle: 'ok');
    }
  }
}
