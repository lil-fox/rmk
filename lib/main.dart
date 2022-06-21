import 'package:flutter/material.dart';

import 'package:rmk/pages/home.dart';
import 'pages/landing.dart';

void main(List<String> args) {
  runApp(RMK());
}

class RMK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //restorationScopeId: "root",
      title: 'РМК',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white))),
      home: LandingPage(),
    );
  }
}
