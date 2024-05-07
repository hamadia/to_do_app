import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 22,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: 'TaskList',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings'),
      ],
    );
  }
}
