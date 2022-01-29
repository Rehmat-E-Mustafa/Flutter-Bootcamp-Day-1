import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key,
    required this.sign,
  required this.onPress}) : super(key: key);

  final String sign;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onPress,
    child:
    Container(
  child:
  Center(child: Text(sign,style: TextStyle(fontSize: 30),),),
  decoration: BoxDecoration(
  color: Colors.blueGrey,
  borderRadius: BorderRadius.circular(15),
  ),
  height: 40,
  width: 40,
      margin: const EdgeInsets.all(5),
  ),
  );
  }
}
