import 'package:app6_bmi_calculator/screens/result_page.dart';
import 'package:app6_bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      routes: {
//        '/': (context) => InputPage(),
//        '/calculation': (context) => ResultPage()
//      },
//      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21)),
      home: InputPage(),
    );
  }
}
