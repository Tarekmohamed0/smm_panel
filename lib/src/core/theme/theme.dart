library theme;

import 'package:flutter/material.dart';
import '../constants/constants.dart';

// إعدادات Light Theme
ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColor.blue,
    scaffoldBackgroundColor: AppColor.white,
    primaryColorLight: AppColor.secondary,
    primaryColorDark: AppColor.darkGrey,
    disabledColor: AppColor.lightGrey,
    splashColor: AppColor.lightBlue, // ripple effect color

    // card view
    cardTheme: CardTheme(
      color: AppColor.white,
      shadowColor: AppColor.black,
      elevation: AppSize.s4,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      color: AppColor.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColor.white,
      ),
      titleTextStyle: AppTextStyle.mediumText,
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primary,
      textTheme: ButtonTextTheme.primary,
      disabledColor: AppColor.lightGrey,
      splashColor: AppColor.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColor.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        textStyle: MaterialStateProperty.all(AppTextStyle.mediumText),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: AppTextStyle.title,
      displayMedium: AppTextStyle.mediumText,
      displaySmall: AppTextStyle.subtitle,
      headlineSmall: AppTextStyle.lightText,
    ),

    // input decoration theme text field
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.lightGrey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.lightGrey,
          width: AppSize.s1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: AppSize.s1,
          color: Colors.red,
        ),
      ),
      labelStyle: AppTextStyle.subtitle,
      hintStyle: AppTextStyle.subtitle,
      errorStyle: AppTextStyle.subtitle.copyWith(color: Colors.red),
    ),
  );
}

// إعدادات Dark Theme
ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColor.blue,
    scaffoldBackgroundColor: AppColor.black,
    primaryColorLight: AppColor.darkGrey,
    primaryColorDark: AppColor.darkGrey,
    disabledColor: AppColor.lightGrey,
    splashColor: AppColor.lightBlue, // ripple effect color

    // card view
    cardTheme: CardTheme(
      color: AppColor.black,
      shadowColor: AppColor.white,
      elevation: AppSize.s4,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      color: AppColor.black,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColor.white,
      ),
      titleTextStyle: AppTextStyle.mediumText.copyWith(color: AppColor.white),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primary,
      textTheme: ButtonTextTheme.primary,
      disabledColor: AppColor.lightGrey,
      splashColor: AppColor.lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColor.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        textStyle: MaterialStateProperty.all(AppTextStyle.mediumText),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: AppTextStyle.title.copyWith(color: AppColor.white),
      displayMedium: AppTextStyle.mediumText.copyWith(color: AppColor.white),
      displaySmall: AppTextStyle.subtitle.copyWith(color: AppColor.white),
      headlineSmall: AppTextStyle.lightText.copyWith(color: AppColor.white),
      bodyMedium: AppTextStyle.mediumText.copyWith(color: AppColor.white),
    ),

    // input decoration theme text field
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.lightGrey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.lightGrey,
          width: AppSize.s1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: AppSize.s1,
          color: Colors.red,
        ),
      ),
      labelStyle: AppTextStyle.subtitle.copyWith(color: AppColor.white),
      hintStyle: AppTextStyle.subtitle.copyWith(color: AppColor.white),
      errorStyle: AppTextStyle.subtitle.copyWith(color: Colors.red),
    ),
  );
}

// تحديد التطبيق لتبديل الوضعين بناءً على النظام
ThemeData getApplicationTheme(ThemeMode themeMode) {
  if (themeMode == ThemeMode.dark) {
    return darkTheme();
  } else {
    return lightTheme();
  }
}
