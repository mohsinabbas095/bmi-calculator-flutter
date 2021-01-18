import 'dart:ui';
import 'file:///D:/Flutter2020/bmi-calculator-flutter/lib/components/bottom_buton.dart';
import 'package:bmi_calculator/constants.dart';
import 'file:///D:/Flutter2020/bmi-calculator-flutter/lib/components/reuseable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String explanation;
  final String suggestion;

  ResultPage(
      {@required this.result,
      @required this.explanation,
      @required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kBmiTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: Reuseable(
                colour: kActiveCardColour,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      explanation,
                      style: kBmiresultTextStyle,
                    ),
                    Text(
                      result,
                      style: kBmiResultNumberStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        suggestion,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              child: BottomButton(
            text: Text('RE-CALCULATE', style: kLargeButtonTextStyle),
            funOnTap: () {
              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
