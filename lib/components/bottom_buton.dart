import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class BottomButton extends StatelessWidget {
  final Function funOnTap;
  Text text;

  BottomButton({this.funOnTap,this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funOnTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(child: text),
        color: kBottomContainerColour,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}