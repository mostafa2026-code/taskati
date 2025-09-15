import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskaty/core/services/hive.dart';

import 'package:taskaty/features/firstscreen/firstscreen.dart';
import 'package:taskaty/features/home/homescreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) =>
              // ignore: unrelated_type_equality_checks
              HiveDate().kisuploaded == true ? Homescreen() : Firstscreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LottieBuilder.asset("assets/icons/Task Done.json")),
    );
  }
}
