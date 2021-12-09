import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.poppins().fontFamily,
    // primaryTextTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20.0,
      )
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    // fontFamily: GoogleFonts.lato().fontFamily,
    fontFamily: GoogleFonts.lato().fontFamily,
    primaryTextTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
  );

  // Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
}