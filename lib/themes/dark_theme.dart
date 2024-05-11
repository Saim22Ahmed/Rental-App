import 'package:airbnb_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.figtree().fontFamily,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white!,
    onPrimaryContainer: Colors.grey[900]!.withOpacity(0.9),
    onPrimary: Color(0xff00B4D8),
    secondary: Colors.grey[900]!,
    tertiary: Colors.grey[800]!,
    onTertiary: Colors.grey[200]!,
    onSecondary: Color(0xff00B4D8),
    inversePrimary: Colors.black,
    onInverseSurface: Colors.grey[200]!,
    onBackground: Colors.black,
  ),
  hintColor: Colors.grey[600],
  shadowColor: Colors.grey[400],
  splashColor: themecolor,
);


// Color(0xffF72585),