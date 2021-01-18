import 'package:flutter/material.dart';
class Reuseable extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  Function onPress;

  Reuseable({@required this.colour, this.cardChild,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          //Color(0xFF1D1E33)
            color: colour,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}