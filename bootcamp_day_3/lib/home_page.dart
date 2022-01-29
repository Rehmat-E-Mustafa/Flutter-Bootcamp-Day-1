import 'dart:math';
import 'weightCalculate.dart';
import 'package:bootcamp_day_3/icon_content.dart';
import 'package:flutter/material.dart';
import 'ReusableCards.dart';
import 'MaterialCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
{
  //0 for male and 1 for female
  int selectedGender = 0;
  int weight = 50;
  int height =160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title : Text('Calculator'),
        backgroundColor: Colors.amberAccent,
      ),
      body:

      Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //gender
          Row(
            children: [
              ReusableCard(
                  cardChild:
                        IconContent(icon: Icons.male,title: 'Male',active: selectedGender==0,),
                  onPress: (){
                setState(() {
                  selectedGender =0;
                });
              }
              ),

              ReusableCard(
                  cardChild:
                  IconContent(icon: Icons.female,title: 'Female',active: selectedGender==1,),
                  onPress: (){
                    setState(() {
                      selectedGender =1;
                    });
                  }
              ),
            ],
          ),
          //measurements
          Row(
            children: [

              ReusableCard(cardChild:
                  MeasureCard(
                    value: weight,
                    title: 'weight',
                    unit: 'kg',
                    increment: (){
                      setState(() {
                        weight++;
                      });
                    } ,
                    decrement: (){
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                  onPress: (){}),
              ReusableCard(cardChild: MeasureCard(
                  value: height,
                      title: 'height',
                      unit: 'cm',
                      increment: (){setState(() {
                        height++;
                      });} ,
                      decrement: (){
                        setState(() {
                          height--;
                        });
                      },
                      )
                  , onPress: (){})
            ],
          ),



          //button
          GestureDetector(
            onTap:(){
              double bmi = weight / pow(height/100, 2);
              String output = bmi.toStringAsFixed(2);
              String result ;
              if (bmi < 18.5)
              {
                result = 'underweight';
              }
              else if (bmi >18.5 && bmi < 24.9){
                result = 'average';
              }else
              {
                result='overweight';
              }
              showDialog(context: context, builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Your BMI is '+output+' \nYou are '+result,
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        child: Text('Back')),
                  ],
                );
              });
            } ,
            child:

          Container(
            color: Colors.white,
            width: double.infinity,

            height: 50,
          child: Center(
          child: Text('Calculate',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey
              ),
            ),
           ),
          ),
          ),
        ],
      ),
    );
  }
}