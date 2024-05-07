import 'package:flutter/material.dart';
import 'package:to_do_app/Features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:to_do_app/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = routeSplashScreen;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
