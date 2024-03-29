import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
 final Color colour;
 final Widget childCard;
 final Function onPress;
  ReusableCard({@required this.colour,this.childCard,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
      child: Container(
        child: childCard,
        height: 170,
        width:double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}