import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///D:/Flutter2020/bmi-calculator-flutter/lib/components/icon_content.dart';
import 'file:///D:/Flutter2020/bmi-calculator-flutter/lib/components/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'file:///D:/Flutter2020/bmi-calculator-flutter/lib/screens/result_page.dart';
import 'file:///D:/Flutter2020/bmi-calculator-flutter/lib/components/bottom_buton.dart';
import 'file:///D:/Flutter2020/bmi-calculator-flutter/lib/components/roundIcon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 175;
  static int weight = 70;
  int age = 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Reuseable(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                )),
                Expanded(
                  child: Reuseable(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                )
              ],
            )),
            Expanded(
                child: Reuseable(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Reuseable(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Reuseable(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(age.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(
              funOnTap: () {
                CalculatorBrain cal =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              result: cal.calculateBMI(),
                              explanation: cal.getResult(),
                              suggestion: cal.getExplanation(),
                            )));
              },
              text: Text('CALCULATE', style: kLargeButtonTextStyle),
            )
          ],
        ));
  }
}
