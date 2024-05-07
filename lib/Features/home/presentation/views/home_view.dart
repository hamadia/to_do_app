import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:to_do_app/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = routeHomeScreen;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeViewBody(),
    );
  }
}
