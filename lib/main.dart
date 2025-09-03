import 'package:flutter/material.dart';
import 'package:taskaty/core/colors/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/core/services/hive.dart';

import 'package:taskaty/features/splash/splash.dart';

void main() async {
  await Hive.initFlutter();
  await HiveDate.initialization();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        inputDecorationTheme: InputDecorationTheme(
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
      ),
    );
  }
}
