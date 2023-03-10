import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

customTextStyle(double fontSize) {
  TextStyle customTextStyle = GoogleFonts.permanentMarker(
      fontSize: fontSize, fontWeight: FontWeight.w400, height: 1);
  return customTextStyle;
}

const Size fieldChangesButtonSize = Size(50, 50);
//const double fieldChangesIconSize = 30;
ButtonStyle fieldChangesLeftButtonStyle = ElevatedButton.styleFrom(
    fixedSize: fieldChangesButtonSize,
    //alignment: Alignment.center,
    //padding: const EdgeInsets.only(left: 17),
    padding: EdgeInsets.zero,
    minimumSize: minimalFieldChangesButtonSize);
ButtonStyle fieldChangesRightButtonStyle = ElevatedButton.styleFrom(
    fixedSize: fieldChangesButtonSize,
    padding: EdgeInsets.zero,
    minimumSize: minimalFieldChangesButtonSize);
const Size minimalFieldChangesButtonSize = Size(10, 10);
