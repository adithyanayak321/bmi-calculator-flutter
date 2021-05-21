import 'package:bmi_calculator/screens/calculation.dart';
import 'package:flutter/cupertino.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_gender_card.dart';
import '../constants.dart';
import '../components/bottom_container.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType {
  male,
  female,
}

String currentBMI;

GenderType selectedGender;
Color maleCardColor = kInactiveCardColor;
Color femaleCardColor = kInactiveCardColor;
double height = 180;
double weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: selectedGender == GenderType.male
                        ? maleCardColor = kActiveCardColor
                        : maleCardColor = kInactiveCardColor,
                    childCard: ReusableGenderCard(
                        genderIcon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        genderText: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      colour: selectedGender == GenderType.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      childCard: ReusableGenderCard(
                        genderIcon: Icon(FontAwesomeIcons.venus, size: 80),
                        genderText: 'FEMALE',
                      )),
                ),
              ],
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kReusableCardTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toStringAsFixed(0),
                          style: kReusableCardSliderText,
                        ),
                        Text(
                          'cm',
                          style: kReusableCardTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xff8d8e98),
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x29eb1555),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30,
                          ),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                          )),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double i) {
                          setState(() {
                            height = i;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("WEIGHT", style: kReusableCardTextStyle,),
                        Text(weight.toStringAsFixed(0),
                          style: kReusableCardSliderText,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus, setWeight: () {
                              setState(() {
                                weight++;
                              });
                            },),
                            SizedBox(width: 15,),
                            RoundIconButton(iconData: FontAwesomeIcons.minus,
                              setWeight: () {
                                setState(() {
                                  weight--;
                                });
                              },),
                          ],)
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("AGE", style: kReusableCardTextStyle,),
                          Text(age.toString(), style: kReusableCardSliderText,),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus, setWeight: () {
                                setState(() {
                                  age++;
                                });
                              },),
                              SizedBox(width: 15,),
                              RoundIconButton(iconData: FontAwesomeIcons.minus,
                                setWeight: () {
                                  setState(() {
                                    age--;
                                  });
                                },),
                            ],)
                        ],
                      ),
                      colour: kActiveCardColor,
                    )),
              ],
            ),
            GestureDetector(
                onTap: () {
                  CalculatorBrain calcBrain = CalculatorBrain(
                      weight: weight, height: height);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          CalculationPage(
                              currentBMI: calcBrain.calculateTheBmi(),
                              weightStatus: calcBrain.getResult(),
                              weightSuggestion: calcBrain.getSuggestion())));

                },
                child: BottomContainer(bottomContainerText: "CALCULATE",
                )
            )
          ]
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function setWeight;

  RoundIconButton({this.iconData, this.setWeight});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(shape: CircleBorder(),
      child: Icon(iconData),
      fillColor: Color(0xff4c4f5e),
      elevation: 6,
      onPressed: setWeight,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
