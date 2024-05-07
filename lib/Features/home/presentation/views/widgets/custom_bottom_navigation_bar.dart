import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_navigation_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: CustomNavigationBar(),
    );
  }
}
