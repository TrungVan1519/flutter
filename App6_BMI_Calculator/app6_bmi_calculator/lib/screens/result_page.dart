import 'package:app6_bmi_calculator/canculator.dart';
import 'package:flutter/material.dart';
import '../components/attributes.dart';
import '../components/reusable.dart';

class ResultPage extends StatelessWidget {
  // Cach 1:
//  final String result, bmi, interpretation;
//
//  ResultPage(
//      {@required this.bmi,
//      @required this.result,
//      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    // Cach 2
    final Calculator args = ModalRoute.of(context).settings.arguments;
    final bmi = args.calculateBMI();
    final result = args.getResult();
    final interpretation = args.getInterpretation();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              color: activeCardColor,
              widgetChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result,
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          ReusableGestureDetector(
            title: 'Re-Calculator',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
