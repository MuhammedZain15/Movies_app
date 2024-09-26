import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationThemeManger {
  static const Color primaryColor = Color.fromRGBO(18, 19, 18, 1.0);
  static ThemeData defaultTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1.0),
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color.fromRGBO(255, 187, 59, 1.0),
      selectedIconTheme: IconThemeData(
        color: const Color.fromRGBO(255, 187, 59, 1.0),
        size: 35.sp,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 25.sp,
      ),
    ),
  );
}
