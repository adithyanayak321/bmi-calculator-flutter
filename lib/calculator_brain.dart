
import 'dart:math';

class CalculatorBrain{
  final double height;
  final double weight;

  CalculatorBrain({this.height,this.weight});
  String calculateTheBmi(){
    return (this.weight/pow(this.height/100, 2)).toStringAsFixed(1);
  }

  String getResult(){
    double parsedBmi=double.parse(calculateTheBmi());
    return (parsedBmi>=25) ? "overweight" :
    (parsedBmi>18.5) ? "NORMAL" :
    'underweight';
  }
  String getSuggestion(){
    double parsedBmi=double.parse(calculateTheBmi());
    return (parsedBmi>=25) ? "you are overweight" :
    (parsedBmi>18.5) ? "you are normal" :
    'you are underweight';
  }
}