import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// TODO - Decidiir la fuente y pasarla a los assets para que no tenga que descargarse
final _textTheme = TextTheme(
  headline1: GoogleFonts.merriweather(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.merriweather(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3:
  GoogleFonts.merriweather(fontSize: 44, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.merriweather(
      fontSize: 28, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.merriweather(
      fontSize: 23, fontWeight: FontWeight.w400, color: Colors.white),
  headline6: GoogleFonts.merriweather(
      fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.merriweather(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.merriweather(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.titilliumWeb(
      fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.titilliumWeb(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.titilliumWeb(
      fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.titilliumWeb(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.titilliumWeb(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ThemeData getTheme(){
  return ThemeData(
    // elevatedButtonTheme:  ElevatedButtonThemeData (style: ElevatedButton.styleFrom(primary: Colors.greenAccent.shade400)),
    canvasColor: Colors.brown.shade50,
    cardColor: Colors.white,
    primaryColor: Colors.brown,
    primaryColorDark: Colors.brown.shade900,
    accentColor: Colors.lightGreenAccent.shade400,
    textTheme: _textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        elevation: 7.0,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        primary: Colors.lightGreenAccent.shade400,
        onPrimary: Colors.black,
        textStyle: TextStyle(),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 12,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      shadowColor: Colors.grey.shade400,
    ),
  );
}
