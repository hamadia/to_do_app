import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/container_view.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/login_view_body.dart';
import 'package:to_do_app/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = routeLoginScreen;

  @override
  Widget build(BuildContext context) {
    return ContainerView(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: const LoginViewBody(),
      ),
    );
  }
}
