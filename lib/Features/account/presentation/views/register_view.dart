import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/container_view.dart';
import 'package:to_do_app/Features/account/presentation/views/widgets/register_view_body.dart';
import 'package:to_do_app/constants.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String routeName = routeRegisterScreen;

  @override
  Widget build(BuildContext context) {
    return ContainerView(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Register Screen'),
        ),
        body: const RegisterViewBody(),
      ),
    );
  }
}
