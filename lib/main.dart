import 'package:bmi_calculator/screens/calculation.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21),
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/second': (context) => CalculationPage(),
      },
    );
  }
}
