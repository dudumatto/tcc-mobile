import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static TextTheme textTheme(TextTheme base) {
    return GoogleFonts.interTextTheme(base).copyWith(
      bodyMedium: GoogleFonts.inter(color: const Color(0xFF0F172A)),
      bodySmall: GoogleFonts.inter(color: const Color(0xFF334155)),
    );
  }
}

