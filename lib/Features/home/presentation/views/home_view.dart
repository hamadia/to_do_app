import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:to_do_app/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = routeHomeScreen;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text('To Do App'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
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
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
