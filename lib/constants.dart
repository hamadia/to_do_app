import 'package:flutter/material.dart';

import 'Features/home/presentation/views/widgets/settings_list.dart';
import 'Features/home/presentation/views/widgets/tasks_list.dart';

const String routeHomeScreen = 'HomeScreen';

const String routeSplashScreen = 'SplashScreen';
const String routeRegisterScreen = 'RegisterScreen';
const String routeLoginScreen = 'LoginScreen';

const kTransitionDuration = Duration(seconds: 3);
int selectedIndex = 0;

final List<Widget> tabs = [
  const TasksListTab(),
  const SettingsListTab(),
];
