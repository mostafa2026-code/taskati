import 'package:flutter/material.dart';

class TaColors {
  final Color blue = Color(0xff4E5AE8);
  final Color red = Color(0xffFF4667);
  final Color black = Color(0xff121212);
  final Color orange = Color(0xffFF8746);
  final Color grey = Color(0xffB4AAAA);
  final Color white = Color(0xffFFFFFF);
}

class Tasktext {
  final String title;

  Tasktext(this.title);

  Text headine() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: TaColors().blue,
      ),
    );
  }

  Text medboldwhite() {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Text mednormalwhite() {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    );
  }

  Text mednormalblack() {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    );
  }

  Text medboldblack() {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
