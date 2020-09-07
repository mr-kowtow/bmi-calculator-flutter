import 'dart:math';
import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({@required this.weight, @required this.height});

  String calculateBMI(){
    double bmi = weight / pow(height/100, 2);
    _bmi = bmi;
    return bmi.toStringAsFixed(1);
  }

  String result(){
    if(_bmi >= 35){return 'Extremely Obese';}
    else if(_bmi >= 30){return 'Obese';}
    else if(_bmi >= 25){return 'Overweight';}
    else if(_bmi >= 18.5){return 'Normal';}
    else {return 'Bruv eat some food';}
  }

  String getInterpretation(){
    if(_bmi >= 35){return 'Better start prayin! You are extremely obese';}
    else if(_bmi >= 30){return 'Get in son! You are obese!';}
    else if(_bmi >= 25){return 'Daymm bro you fat';}
    else if(_bmi >= 18.5){return 'You are healthy';}
    else {return 'Bruv eat some food';}
  }
}