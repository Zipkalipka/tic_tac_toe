import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

customTextStyle(double fontSize) {
  TextStyle customTextStyle = GoogleFonts.permanentMarker(
    fontSize: fontSize, fontWeight: FontWeight.w400,);
  return customTextStyle;
}