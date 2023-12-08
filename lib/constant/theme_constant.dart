import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const lightColor = Color(0xff512A00);
const darkColor = Color(0xffFFE2D2);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  brightness: Brightness.light,
  primaryColor: lightColor,
  iconTheme: const IconThemeData(color: lightColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: lightColor,
    unselectedItemColor: lightColor.withOpacity(.80),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: GoogleFonts.quicksand(color: lightColor),
    unselectedLabelStyle: GoogleFonts.quicksand(
      color: lightColor.withOpacity(.80),
    ),
  ),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.quicksand(
      color: const Color(0xff512A00),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: lightColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(lightColor))),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  iconTheme: const IconThemeData(color: darkColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: darkColor,
    unselectedItemColor: darkColor.withOpacity(.80),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: GoogleFonts.quicksand(color: darkColor),
    unselectedLabelStyle: GoogleFonts.quicksand(
      color: darkColor.withOpacity(.80),
    ),
  ),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.quicksand(
      color: darkColor,
    ),
    bodyMedium: GoogleFonts.quicksand(color: darkColor),
  ),
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);
