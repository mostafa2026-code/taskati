import 'package:flutter/material.dart';
import 'package:taskaty/core/colors/colors.dart';

class MyTheme {
  ThemeData lighttheme() {
    return ThemeData(
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
      scaffoldBackgroundColor: Color(0xff090809),
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.dark(
    primary:   Color(0xff2097f3),
    onSurface: Color(0xff2097f3),
  ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Color(0xff434243),
        dayStyle: TextStyle(color: TaColors().white),
      ),
      textSelectionTheme: TextSelectionThemeData(),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Color(0xff434243),
        dayPeriodColor: Color(0xff585859),
        hourMinuteColor: Colors.white,
        dialBackgroundColor: Color(0xff585859),
        dialHandColor: Color(0xff2097f3),
        helpTextStyle: TextStyle(color: Color(0xff2097f3) , fontSize: 24),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Color(0xff2097f3),
          prefixIconColor: Color(0xff2097f3),
          suffixIconColor: Color(0xff2097f3),
          
        ),
        dayPeriodTextColor: Color(0xff2097f3) ,
        hourMinuteTextColor:Color(0xff2097f3) ,
        
      
        

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
    );
  }
}
