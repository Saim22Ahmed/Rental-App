import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.josefinSans().fontFamily,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    onPrimaryContainer: Color(0xff00B4D8),
    onPrimary: Color(0xff00B4D8),
    secondary: Colors.grey[900]!,
    tertiary: Colors.grey[800]!,
    onTertiary: Colors.grey[200]!,
    onSecondary: Color(0xff00B4D8),
    inversePrimary: Colors.grey[200]!,
    onInverseSurface: Colors.grey[200]!,
    onBackground: Colors.black,
  ),
  hintColor: Colors.grey[600],
  shadowColor: Colors.grey[400],
  splashColor: Colors.grey[900],
);


// Color(0xffF72585),