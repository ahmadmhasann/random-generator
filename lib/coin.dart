import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

class coin extends StatefulWidget {
  @override
  _coinState createState() => _coinState();
}

class _coinState extends State<coin> {
  int coinNumber = 0;
  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      updateCoin();
    });
    detector.startListening();

  }

  void updateCoin() {
    setState(() {
      coinNumber = Random().nextInt(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text('Coin Flipper', style: TextStyle(

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
                  'Tap the coin or shake your phone to flip the coin',
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
                          updateCoin();
                        },
                        child: Image.asset('images/coin$coinNumber.png'),
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
