import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static AppTheme of(BuildContext context) => LightModeTheme();

  Color? primaryColor;
  Color? secondaryColor;
  Color? tertiaryColor;
  Color? alternate;
  Color? primaryBackground;
  Color? secondaryBackground;
  Color? primaryText;
  Color? secondaryText;

  TextStyle get title1 => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get title2 => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  TextStyle get title3 => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );

  // TextStyle get appBarTitle => GoogleFonts.getFont(
  //       'MontserratSemiBold',
  //       color: Color(0xFF00216D),
  //       fontWeight: FontWeight.w600,
  //       fontSize: 16,
  //     );

  TextStyle get subtitle1 => GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );

  TextStyle get subtitle2 => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.poppins(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class LightModeTheme extends AppTheme {
  // Color? primaryColor = const Color(0xFF00216D);
  // Color? secondaryColor = const Color(0xFF50B6DD);
  // Color? tertiaryColor = const Color(0xFFFFFFFF);
  // Color? alternate = const Color(0x00000000);
  // Color? primaryBackground = const Color(0x00000000);
  // Color? secondaryBackground = const Color(0x00000000);
  // Color? primaryText = const Color(0x00000000);
  // Color? secondaryText = const Color(0x00000000);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.poppins(
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
