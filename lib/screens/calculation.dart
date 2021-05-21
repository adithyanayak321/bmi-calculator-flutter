import 'package:bmi_calculator/components/bottom_container.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CalculationPage extends StatelessWidget {
final String currentBMI;
final String weightStatus;
final String weightSuggestion;
CalculationPage({this.currentBMI,this.weightStatus,this.weightSuggestion});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Center(child: kTitleText),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kActiveCardColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      weightStatus,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '$currentBMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 150,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      weightSuggestion,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: BottomContainer(
                bottomContainerText: 'RE-CALCULATE',
              ),
            ),
          ],
        ));
  }
}
