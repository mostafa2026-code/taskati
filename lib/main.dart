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
    return ValueListenableBuilder(
      valueListenable: HiveDate.userbox.listenable(),
      builder: (context, value, child) {
        bool isdark = value.get(HiveDate().kisdark) ?? false;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: isdark ? ThemeMode.dark : ThemeMode.light,
          home: Splash(),
          theme: MyTheme().lighttheme(),
          darkTheme: MyTheme().darktheme(),
        );
      },
    );
  }
}
