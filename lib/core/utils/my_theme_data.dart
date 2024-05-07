import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimaryColor,
    ),
    scaffoldBackgroundColor: AppColors.lightScaffoldBackGroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: AppColors.lightPrimaryColor,
      unselectedItemColor: AppColors.greyColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightPrimaryColor,
    ),
    scaffoldBackgroundColor: AppColors.darkScaffoldBackGroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: AppColors.lightPrimaryColor,
      unselectedItemColor: AppColors.greenColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
    ),
  );
}
