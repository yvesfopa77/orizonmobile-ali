// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orizon/app/core/theme/app_theme.dart';

class AppTextStyle {
  AppTextStyle._();

  static Weight get s8 => Weight(8);
  static Weight get s10 => Weight(10);
  static Weight get s11 => Weight(11);
  static Weight get s12 => Weight(12);
  static Weight get s13 => Weight(13);
  static Weight get s14 => Weight(14);
  static Weight get s15 => Weight(15);
  static Weight get s16 => Weight(16);
  static Weight get s18 => Weight(18);
  static Weight get s24 => Weight(24);
  static Weight get s30 => Weight(30);
  static Weight get s32 => Weight(32);
  static Weight get s34 => Weight(34);
  static Weight get s36 => Weight(36);
  static Weight get s40 => Weight(40);
}

class Weight {
  late double _fontsize;
  Weight(double fontsize) {
    _fontsize = fontsize;
  }
  FontColor get light => FontColor(_fontsize, FontWeight.w300);
  FontColor get regular => FontColor(_fontsize, FontWeight.w400);
  FontColor get medium => FontColor(_fontsize, FontWeight.w500);
  FontColor get semiBold => FontColor(_fontsize, FontWeight.w600);
  FontColor get bold => FontColor(_fontsize, FontWeight.w700);
  FontColor get extraBold => FontColor(_fontsize, FontWeight.w800);
}

class FontColor {
  late double _fontSize;
  late FontWeight _fontweight;
  FontColor(double fontSize, FontWeight fontWeight) {
    _fontSize = fontSize;
    _fontweight = fontWeight;
  }

  TextStyle get black => TextStyle(
        fontWeight: _fontweight,
        color: AppTheme.black_color,
        fontSize: _fontSize.sp,
      );
  TextStyle get grey => TextStyle(
        fontWeight: _fontweight,
        color: AppTheme.grey_color,
        fontSize: _fontSize.sp,
      );
  TextStyle get white => TextStyle(
        fontWeight: _fontweight,
        color: AppTheme.white_color,
        fontSize: _fontSize.sp,
      );
  TextStyle get peach_orange => TextStyle(
        fontWeight: _fontweight,
        color: AppTheme.peach_orange_color,
        fontSize: _fontSize.sp,
      );
}
