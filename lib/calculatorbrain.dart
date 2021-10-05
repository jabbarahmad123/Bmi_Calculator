import 'dart:math';

import 'package:flutter/material.dart';

class calculatorbrain {
  calculatorbrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'YOU HAVE A HIGHER THAN NORMAL BODY WEIGHT.TRY TO EXERCISE MORE';
    } else if (_bmi > 18.5) {
      return 'YOU HAVE A NORMAL BODY WEIGHT.GOOD JOB';
    } else {
      return 'YOU HAVE A LOWER THAN NORMAL BODY WEIGHT.YOU CAN EAT A BIT MORE';
    }
  }
}
