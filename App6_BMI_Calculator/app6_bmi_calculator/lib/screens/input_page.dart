import 'package:app6_bmi_calculator/canculator.dart';
import 'package:app6_bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import '../components/attributes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;

  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: new ReusableContainer(
                      color: maleColor = selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      widgetChild: ReusableColumn(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: new ReusableContainer(
                      color: femaleColor = selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      widgetChild: ReusableColumn(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: new ReusableContainer(
              color: activeCardColor,
              widgetChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(' cm'),
                    ],
                  ),
                  Theme(
                    data: ThemeData(
                      sliderTheme: SliderThemeData(
                        activeTrackColor: Colors.white,
                        // <=> Slider.activeColor
                        inactiveTrackColor: inactiveCardColor,
                        // <=> Slider.inactiveColor
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
//                        overlayColor: Color(0xFFEB1555),
                        overlayColor: Color(0xFF29EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24.0),
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
//                      activeColor: Colors.white,
//                      inactiveColor: inactiveCardColor,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                          print(height);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableContainer(
                    color: activeCardColor,
                    widgetChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(' kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: floatingActionButtonColor,
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            new ReusableRawButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              shapeBorder: CircleBorder(),
                            ),
                            // Widget nay cho phep ta custom Button theo y muon
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new ReusableContainer(
                    color: activeCardColor,
                    widgetChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new ReusableRawButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            new ReusableRawButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            // Widget nay cho phep ta custom Button theo y muon
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ReusableGestureDetector(
            title: 'Calculate',
            onTap: () {
              Calculator calculator =
                  new Calculator(weight: weight, height: height);
              // Cach 1:
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ResultPage(
//                    bmi: calculator.calculateBMI(),
//                    result: calculator.getResult(),
//                    interpretation: calculator.getInterpretation(),
//                  ),
//                ),
//              );

              // Cach 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(),
                  settings: RouteSettings(arguments: calculator),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
