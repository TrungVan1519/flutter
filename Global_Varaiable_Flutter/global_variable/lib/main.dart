import 'package:flutter/material.dart';
import 'global_variable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text(GlobalVariable.globalVariable.value),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Page2()));
          },
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text(GlobalVariable.globalVariable.value),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
