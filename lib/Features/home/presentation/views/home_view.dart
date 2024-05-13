import 'package:flutter/material.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:to_do_app/Features/home/presentation/views/widgets/custom_navigation_bar.dart';
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
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTabTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: tabs[selectedIndex],
    );
  }
}
