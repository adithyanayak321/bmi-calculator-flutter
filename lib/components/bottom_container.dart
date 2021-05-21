import 'package:flutter/material.dart';
import '../constants.dart';
class BottomContainer extends StatelessWidget {
 final String bottomContainerText;
 BottomContainer({this.bottomContainerText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Center(child: Text(bottomContainerText,style: kLargeTextStyle,)),
      color: kBottomContainerColor,
      height: kBottomContainerHeight,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
    );
  }
}