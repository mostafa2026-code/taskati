import 'package:flutter/material.dart';
import 'package:taskaty/core/colors/colors.dart';

class MyTheme {
  ThemeData lighttheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: TaColors().blue,
        onSurface: TaColors().black,
      ),
      fontFamily: 'Poppins',
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: TaColors().grey),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().blue, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().black, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().red, width: 1),
        ),
      ),
    );
  }

  ThemeData darktheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff090809),
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: TaColors().white),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: TaColors().blue,
        onSurface: TaColors().white,
      ),
      scaffoldBackgroundColor: Color(0xff090809),
      fontFamily: 'Poppins',
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.grey.shade900, // الخلفية زي الصورة
        headerBackgroundColor: Colors.grey.shade800,
        headerForegroundColor: Colors.white,
        weekdayStyle: TextStyle(color: Colors.white70),
      ),
      textSelectionTheme: TextSelectionThemeData(),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Color(0xff434243),
        dayPeriodColor: Color(0xff585859),
        hourMinuteColor: Colors.white,
        dialBackgroundColor: Color(0xff585859),
        dialHandColor: Color(0xff2097f3),
        helpTextStyle: TextStyle(color: Color(0xff2097f3), fontSize: 24),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Color(0xff2097f3),
          prefixIconColor: Color(0xff2097f3),
          suffixIconColor: Color(0xff2097f3),
        ),
        dayPeriodTextColor: Color(0xff2097f3),
        hourMinuteTextColor: Color(0xff2097f3),

        dialTextColor: Colors.white,
        hourMinuteTextStyle: TextStyle(color: Color(0xff2097f3)),
      ),

      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: TaColors().white),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().red, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().blue, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().white, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: TaColors().red, width: 1),
        ),
      ),
      dialogTheme: DialogThemeData(
        
    backgroundColor: const Color(0xFF1E1E1E),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: const TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.blue[300], // لون الأزرار (OK / Cancel)
    ),
  ),
    
    );
  }
}
