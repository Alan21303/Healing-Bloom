import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Luxury color palette
  static const Color royalPlum = Color(0xFF4B0C66);
  static const Color velvetAmethyst = Color(0xFF703D8A);
  static const Color lavenderMist = Color(0xFFC2A1E6);
  static const Color opulentLilac = Color(0xFFE8DDF0);
  static const Color champagneGold = Color(0xFFE6C28E);
  static const Color pearlWhite = Color(0xFFFAF7F5);
  static const Color textColor = Color(0xFF2C1810);

  static ThemeData lightTheme = ThemeData(
    primaryColor: royalPlum,
    scaffoldBackgroundColor: pearlWhite,
    textTheme: GoogleFonts.playfairDisplayTextTheme().copyWith(
      displayLarge: const TextStyle(
        color: velvetAmethyst,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        color: royalPlum,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: const TextStyle(
        color: textColor,
        fontSize: 16,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: royalPlum,
        foregroundColor: pearlWhite,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: champagneGold, width: 1.5),
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB((0.1 * 255).toInt(), opulentLilac.r.toInt(),
          opulentLilac.g.toInt(), opulentLilac.b.toInt()),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: champagneGold),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: lavenderMist),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: champagneGold, width: 2),
      ),
      labelStyle: const TextStyle(color: velvetAmethyst),
      prefixIconColor: velvetAmethyst,
    ),
  );
}
