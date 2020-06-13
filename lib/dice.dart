import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class dice extends StatefulWidget {
  @override
  _diceState createState() => _diceState();
}

class _diceState extends State<dice> {
  int leftDice = 1;
  int rightDice = 2;
  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      updateDice();
    });
    detector.startListening();

  }

  void updateDice  () {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text('Dice Roller', style: TextStyle(

          ),),
        ),
        backgroundColor: Color.fromRGBO(17 , 45, 74, 100),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tap the dice or shake your phone to roll the dice',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 40.0,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: (){
                          updateDice();
                        },
                        child: Image.asset('images/dice$leftDice.jpg'),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: (){
                          updateDice();
                        },
                        child: Image.asset('images/dice$rightDice.jpg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
