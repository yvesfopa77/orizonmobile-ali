// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orizon/app/core/theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static const peach_orange_color = Color.fromRGBO(216, 82, 2, 1);
  static const yellow_color = Color.fromRGBO(232, 176, 30, 1);
  static const white_color = Colors.white;
  static const black_color = Colors.black;
  static const grey_color = Color.fromRGBO(106, 108, 113, 1);
  static const border_color = Color.fromRGBO(208, 214, 226, 1);
  static const sea_blue_color = Color.fromRGBO(15, 116, 146, 1);

  static ThemeData apptheme = ThemeData(
    fontFamily: "NM",
    scaffoldBackgroundColor: const Color.fromRGBO(245, 247, 248, 1),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    colorScheme: const ColorScheme.light(
        primary: peach_orange_color, secondary: white_color),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            disabledBackgroundColor: Colors.white,
            disabledForegroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 56),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            backgroundColor: peach_orange_color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)))),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyle.s13.regular.grey,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: border_color)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: border_color)),
    ),
  );
}
