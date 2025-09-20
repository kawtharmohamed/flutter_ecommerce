import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: MyColors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.white,
    elevation: 0,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: MyColors.mainColor),
);

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: MyColors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: MyColors.black,
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: MyColors.white),
  colorScheme: ColorScheme.fromSeed(
    seedColor: MyColors.mainColor,
    brightness: Brightness.dark,
  ),
);
