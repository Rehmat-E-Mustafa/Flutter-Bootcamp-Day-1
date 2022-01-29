import 'package:flutter/material.dart';
import 'roundButton.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({Key? key,
    required this.title,
    required this.decrement,
    required this.increment,
    required this.unit,
    required this.value}) : super(key: key);

  final String title;
  final int value;
  final String unit;
  final void Function() increment;
  final void Function() decrement;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value.toString(),
            style: TextStyle(
              fontSize:40,
              fontWeight: FontWeight.bold,
            ),),
            Text(unit),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          RoundButton(sign: '-', onPress: decrement),
            RoundButton(sign: '+', onPress: increment)
          ],
        ),
      ],
    );
  }
}

