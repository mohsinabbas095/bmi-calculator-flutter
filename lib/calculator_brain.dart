import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;
  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getExplanation() {
    if (_bmi >= 25) {
      return 'Dude, you should do some exercise and Eat less please.';
    } else if (_bmi > 18.5) {
      return 'You are doing great, keep going Mate, keep up the Good Work';
    } else {
      return 'You should eat more and focus on getting some more weight, Get some snacks now!';
    }
  }
}
