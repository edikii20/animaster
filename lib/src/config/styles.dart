import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color mainBlack = Color(0xFF212121);
  static const Color mainSecondaryDark = Color(0xFFE0E0E0);
  static const Color mainSecondaryLight = Color(0xFF616161);
  static const Color mainButtonWhiteLight = Color(0xFFF0EDFF);
  static const Color mainDisableLight = Color(0xFF9E9E9E);
  static const Color mainDisableDark = Color(0xFFC3B6FF);
  static const Color mainPurple = Color(0xFF6949FF);
  static const Color mainPurpleDark = Color(0xFF543ACC);
  static const Color gold = Color(0xFFffd132);
  static const Color silver = Color(0xFFa6c1f4);
  static const Color bronze = Color(0xFFc2723f);
  static const Color white = Color(0xFFFFFFFF);
}

abstract class AppTextStyles {
  static TextStyle regular({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Nunito',
      fontSize: fontSize,
    );
  }

  static TextStyle medium({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Nunito',
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Nunito',
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Nunito',
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }
}
