import 'dart:math';

class Calculator {
  int _weight, _height;
  double _bmi;

  Calculator({int weight, int height}) {
    this._weight = weight;
    this._height = height;
  }

  String calculateBMI() {
    this._bmi = this._weight / pow(this._height / 100, 2);
    // Reformat lai bmi chi duoc phep hien thi 2 chu so sau dau '.'
    return this._bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.0) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return 'You have a higher than normal body weight, try to exercise more';
    } else if (_bmi > 18.0) {
      return 'You have a normal body weight, goodjob';
    } else {
      return 'You have a lower than normal body weight, you can eat a bit more';
    }
  }
}
