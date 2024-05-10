import 'package:flutter/material.dart';
import 'package:to_do_app/Features/account/presentation/views/register_view.dart';
import 'package:to_do_app/Features/home/presentation/views/home_view.dart';
import 'package:to_do_app/Features/splash/presentation/views/splash_view.dart';
import 'package:to_do_app/core/utils/my_theme_data.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        SplashView.routeName: (context) => const SplashView(),
        RegisterView.routeName: (context) => const RegisterView(),
      },
      initialRoute: RegisterView.routeName,
    );
  }
}