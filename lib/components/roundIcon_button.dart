import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  final IconData icon;

  Function onpressed;

  RoundIconButton({this.icon, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        width: 48,
        height: 48,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
    );
  }
}