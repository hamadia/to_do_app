import 'package:flutter/material.dart';

import 'Features/home/presentation/views/settings_tab_view.dart';
import 'Features/home/presentation/views/tasks_tab_view.dart';

const String routeHomeScreen = 'HomeScreen';

const String routeSplashScreen = 'SplashScreen';
const String routeRegisterScreen = 'RegisterScreen';
const String routeLoginScreen = 'LoginScreen';

const kTransitionDuration = Duration(seconds: 3);
int selectedIndex = 0;

final List<Widget> tabs = [
  const TasksTabView(),
  const SettingsTabView(),
];
