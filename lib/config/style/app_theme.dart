import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';


ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    fontFamily: "cairo",
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.grey,
        showUnselectedLabels: true,
        ),
    appBarTheme:  const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColor.white,
            statusBarIconBrightness: Brightness.dark)),
    scaffoldBackgroundColor: AppColor.backGround,
    // highlightColor: Colors.transparent,
inputDecorationTheme: InputDecorationTheme
    (
    border: OutlineInputBorder
        (
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.grey),
    ),
    focusedBorder: OutlineInputBorder
        (
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColor.primary)
    )
),
    // focusColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
    primary: AppColor.primary,
 surface: AppColor.backGround
    ));
