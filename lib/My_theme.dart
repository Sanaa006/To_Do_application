import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff5D9CEC);
  static Color backgroundColorLight = Color(0xffDFECDB);
  static Color backgroundColorDark = Color(0xff060E1E);
  static Color primaryColorDark = Color(0xff141922);
  static Color primaryColorLight = Color(0xffffffff);
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor = Color(0xff383838);
  static Color rad = Color(0xffE43737);
  static Color green = Color(0xff61E757);
  static Color gray = Color(0xffC8C9CB);
  //light mode
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: backgroundColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: gray,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: primaryColorLight),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: CircleBorder(side: BorderSide(color: primaryColorLight, width: 5)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: primaryColorLight, shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ))),
    cardColor: primaryColorLight,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: primaryColorLight),
      bodyLarge:
          TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
      bodyMedium:
          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: green),
      bodySmall:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: gray),
      labelLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
      labelMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: blackColor),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: blackColor),
      labelSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor),
      displaySmall:
          TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: gray),
    ),
  );
  //dark mode
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: primaryColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: backgroundColorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: primaryColor,
      unselectedItemColor: gray,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: primaryColorDark),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: CircleBorder(side: BorderSide(color: primaryColorDark, width: 3)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: primaryColorDark,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ))
    ),
    cardColor: primaryColorDark,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: primaryColorDark),
      bodyLarge:
          TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: green),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
      bodyMedium:
          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: green),
      bodySmall:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: gray),
      labelLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: whiteColor),
      labelMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: whiteColor),
      labelSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor),
      displaySmall:
          TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: gray),
    ),
  );
}
