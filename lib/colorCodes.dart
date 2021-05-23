
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color pPrimaryColor = Color(0xFFba2d65);
Color pMedColor = Color(0xFFf06292);
Color pSecondaryColor = Color(0xFFff94c2);
Color pContentColorLightTheme = Color(0xFF1D1D35);
Color pContentColorDarkTheme = Color(0xFFF5FCF9);
const pDefaultPadding = 20.0;

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: pPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: pContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context)
       .textTheme).apply(bodyColor: pContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: pPrimaryColor,
      secondary: pSecondaryColor,
      ),
    );
  }

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: pPrimaryColor,
    scaffoldBackgroundColor: pContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: pContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context)
      .textTheme).apply(bodyColor: pContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: pPrimaryColor,
      secondary: pSecondaryColor, 
      ),
  );
}

final appBarTheme = AppBarTheme(
        color:pPrimaryColor, centerTitle: false, elevation: 0);