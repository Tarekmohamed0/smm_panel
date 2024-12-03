library text_style;

import 'package:flutter/material.dart';

mixin FontFamily {
  static String get primary => 'Montserrat';
  static String get secondary => 'Roboto';
}
mixin AppFontWeight {
  static FontWeight get w100 => FontWeight.w100;
  static FontWeight get w200 => FontWeight.w200;
  static FontWeight get w300 => FontWeight.w300;
  static FontWeight get w400 => FontWeight.w400;
  static FontWeight get w500 => FontWeight.w500;
  static FontWeight get w600 => FontWeight.w600;
  static FontWeight get w700 => FontWeight.w700;
  static FontWeight get w800 => FontWeight.w800;
  static FontWeight get w900 => FontWeight.w900;
}

mixin Fontsize {
  static double get s12 => 12.0;
  static double get m14 => 14.0;
  static double get l16 => 16.0;
  static double get xl18 => 18.0;
  static double get xxl20 => 20.0;
  static double get xxxl22 => 22.0;
}
//
mixin Font implements AppFontWeight {
  static FontWeight get l => FontWeight.w300;
  static FontWeight get n => FontWeight.w400;
  static FontWeight get sb => FontWeight.w500;
  static FontWeight get b => FontWeight.w700;
}

mixin size implements Fontsize {
  static double get s12 => 12.0;
  static double get m14 => 14.0;
  static double get l16 => 16.0;
  static double get xl18 => 18.0;
  static double get xxl20 => 20.0;
  static double get xxxl22 => 22.0;
}
// mixin for fontfamily
mixin fontFamily implements FontFamily {
  static String get primary => 'Poppins';
  static String get secondary => 'Roboto';
}

//
class AppTextStyle {
  static TextStyle get title => TextStyle(
        fontFamily: fontFamily.primary,
        fontSize: size.xl18,
        fontWeight: Font.b,
      );

  static TextStyle get subtitle => TextStyle(
        fontFamily: fontFamily.primary,
        fontSize: size.m14,
        fontWeight: Font.n,
      );

  static TextStyle get mediumText => TextStyle(
        fontFamily: fontFamily.primary,
        fontSize: size.l16,
        fontWeight: Font.sb,
      );

  static TextStyle get lightText => TextStyle(
        fontFamily: fontFamily.primary,
        fontSize: size.m14,
        fontWeight: Font.l,
      );

  static TextStyle get titleLight => TextStyle(
        fontFamily: fontFamily.primary,
        fontSize: size.xl18,
        fontWeight: Font.l,
      );
}
  // static TextStyle get body => TextStyle();
  // static TextStyle get caption => TextStyle();
  // static TextStyle get button => TextStyle();
  // static TextStyle get overline => TextStyle();
  // static TextStyle get display => TextStyle();
  // static TextStyle get headline => TextStyle();
  // static TextStyle get subhead => TextStyle();
  // static TextStyle get paragraph => TextStyle();

