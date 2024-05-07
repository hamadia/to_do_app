import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/home_view.dart';
import 'package:to_do_app/Features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        SplashView.routeName: (context) => const SplashView(),
      },
      initialRoute: SplashView.routeName,
    );
  }
}