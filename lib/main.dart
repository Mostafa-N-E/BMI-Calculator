import 'package:flutter/material.dart';
import 'input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff0a0d22),
        bottomAppBarColor: Color(0xff0a0d22),
        primaryColor: Color(0xff0a0d22),
        appBarTheme:AppBarTheme(
          backgroundColor: Color(0xff0a0d22),
        ),
      ),
      home: InputPage(),
    );
  }
}
