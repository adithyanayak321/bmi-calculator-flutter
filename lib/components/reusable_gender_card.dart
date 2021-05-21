import 'package:flutter/material.dart';
import '../constants.dart';
class ReusableGenderCard extends StatelessWidget {
 final Icon genderIcon;
final String genderText;

ReusableGenderCard({this.genderText,this.genderIcon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        genderIcon,
        SizedBox(height:15),
        Text(genderText,style:kReusableCardTextStyle ),
      ],
    );
  }
}

