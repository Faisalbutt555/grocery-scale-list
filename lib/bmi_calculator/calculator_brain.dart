// @dart=2.9

import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi; //_bmi is a private member of the function
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi
        .toStringAsFixed(1); //this wil return the double into decimal digit 1
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'you are overweight';
    } else if (_bmi > 18.5) {
      return 'you are normal';
    } else {
      return 'yor are underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try more exercise';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight good job';
    } else {
      return 'You have lower than normal.Try to eat bit more';
    }
  }
}
