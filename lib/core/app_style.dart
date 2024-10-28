import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle style10W500Black = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
  static TextStyle style12W500Black = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.0,
  );

  static TextStyle style16W500Black =
      GoogleFonts.inter(fontSize: 16, color: Colors.black);
  static TextStyle style18W500Black =
      GoogleFonts.inter(fontSize: 16, color: Colors.black);
  static TextStyle style14W500Black = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle style15W500Black = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle style14W500hepo = GoogleFonts.heebo(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle style22W500Black = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );
  static TextStyle style24W500Black = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  //Heebo
  static TextStyle style16W500hepo = GoogleFonts.heebo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  //Inter
  static TextStyle style18W500Inter = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}
