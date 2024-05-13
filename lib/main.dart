import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Features/account/presentation/manager/register_and_login_provider.dart';
import 'package:to_do_app/Features/account/presentation/views/login_view.dart';
import 'package:to_do_app/Features/account/presentation/views/register_view.dart';
import 'package:to_do_app/Features/home/presentation/views/home_view.dart';
import 'package:to_do_app/Features/splash/presentation/views/splash_view.dart';
import 'package:to_do_app/core/utils/my_theme_data.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => MyAuthProvider(),
    child: const ToDoApp(),
  ));
}

Future<void> firebaseInitializeApp() async {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        LoginView.routeName: (context) => const LoginView(),
      },
      initialRoute: LoginView.routeName,
    );
  }
}