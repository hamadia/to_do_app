import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        selectedIndex = index;
        setState(() {});
      },
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
