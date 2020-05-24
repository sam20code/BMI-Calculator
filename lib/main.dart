import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xff0A0E21),
            scaffoldBackgroundColor: Color(0xff0A0E21),//in dart we add color code by simply removing # and adding 0xff instead
            ),
      home: InputPage(),
    );
  }
}
