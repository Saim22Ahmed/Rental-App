import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.figtree().fontFamily,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white!,
    primary: Colors.black,
    onPrimary: Color(0xff00B4D8),
    onPrimaryContainer: Colors.white,
    secondary: Colors.grey[200]!,
    onSecondary: Colors.grey[600]!,
    tertiary: Color(0xff00B4D8),
    onTertiary: Color(0xff00B4D8),
    inversePrimary: Colors.white!,
    onInverseSurface: Colors.grey[800]!,
    onBackground: Colors.white,
  ),
  hintColor: Colors.grey[300],
  shadowColor: Colors.white70,
  splashColor: themecolor,
);



// ThemeData lightTheme = ThemeData(
//     brightness: Brightness.light,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.transparent,
//     ),
//     colorScheme: ColorScheme.light(
//       background: Color(0xffE3D5CA),
//       primary: Color(0xffF5EBE0),
//       secondary: Color(0xffE3D5CA),
//       tertiary: Color(0xffD5BDAF),
//     ));