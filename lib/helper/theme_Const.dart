import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeMethod(BuildContext context) {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      textTheme: GoogleFonts.nunitoTextTheme());
}
