import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty/core/services/hive.dart';
import 'package:taskaty/core/utils/theme.dart';
import "package:taskaty/features/splash/splash.dart";



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
      themeMode:ThemeMode.light,
      home: Splash(),
      theme: MyTheme().lighttheme(),
      darkTheme: MyTheme().darktheme(),
    );
  }
}
