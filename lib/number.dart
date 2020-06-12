import 'package:flutter/material.dart';
import 'dart:math';

class number extends StatefulWidget {
  final String text;
  number({@required this.text});

  @override
  _numberState createState() => _numberState();
}

class _numberState extends State<number> {
  int flag = 1;
  int rand = 0;
  List<int> generatedNumbers = new List(10000);
  int generatedCounter = 0;
  TextEditingController startNumberController = new TextEditingController();
  TextEditingController endNumberController = new TextEditingController();
  int startNumber = 0;
  int endNumber = 0;
  int numberOfItems = 0;
  String output = '';
  String repeatCounter = '';
  bool repeat = true;
  bool startWrong = true;
  bool endWrong = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text('Random Number', style: TextStyle(

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
                Container(
                  padding: EdgeInsets.all(16.0),
                  width: 220,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: startNumberController,
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 20.0,
                      color: Colors.black87,
                    ),
                    onChanged: (text) {
                      try {
                        startNumber = int.parse(text);
                        numberOfItems = endNumber - startNumber + 1;
                        generatedCounter=0;
                        setState(() {
                          repeatCounter = numberOfItems>=0? '$generatedCounter/$numberOfItems' : '';
                        });
                        startWrong = false;
                      }
                      catch(e) {
                        startWrong = true;
                      }
                    },

                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Start Number',
                      contentPadding: EdgeInsets.all(20.0),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  width: 220,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: endNumberController,
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 20.0,
                      color: Colors.black87,
                    ),
                    //maxLength: 32,
                    onChanged: (text) {
                      try {
                        endNumber = int.parse(text);
                        numberOfItems = endNumber - startNumber + 1;
                        generatedCounter=0;
                        setState(() {
                          repeatCounter = numberOfItems>=0? '$generatedCounter/$numberOfItems' : '';

                        });
                        endWrong = false;
                      }
                      catch(e) {
                        endWrong = true;
                      }


                    },

                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'End Number',
                      contentPadding: EdgeInsets.all(20.0),
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.black54),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(

                        value: repeat,
                        activeColor: Colors.green,
                        onChanged: (newValue) {
                          setState(() {
                            repeat = newValue;
                            generatedCounter = 0;
                            repeatCounter = '$generatedCounter/$numberOfItems';

                          });
                        }),
                    Text(
                      'No repeat',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$repeatCounter',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 20.0,
                    color: repeat? Colors.black87 : Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),


                FlatButton(
                  padding: EdgeInsets.all(25.0),
                  onPressed: () {
                    if (startWrong || endWrong) {
                      output = 'Please enter positive numbers';
                    }
                    else if (endNumber <= startNumber) {
                      output =
                          'End number can not be less than or equal to start number';
                    } else {

                      if (!repeat) {
                        rand = Random().nextInt(numberOfItems) + startNumber;
                        output = rand.toString();
                      }
                      else {
                        if (generatedCounter == numberOfItems) {
                          generatedCounter = 0;
                        }
                        if (generatedCounter == 0) {
                          var list = new List<int>.generate(
                              numberOfItems, (int index) => index);
                          list.shuffle();
                          generatedNumbers = List.from(list);
                        }
                        output =
                            (generatedNumbers[generatedCounter] + startNumber)
                                .toString();
                        generatedCounter++;
                        setState(() {
                          repeatCounter = '$generatedCounter/$numberOfItems';
                        });
                      }
                    }
                    bool nonNumber = false;
                    try {
                      int x = int.parse(output);
                    }
                    catch (e) {
                      nonNumber = true;
                    }
                    FocusScope.of(context).requestFocus(FocusNode());
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.deepOrange,
                          content: Text(
                              output,
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: nonNumber? 20.0 : 100.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(
                    Icons.autorenew,
                    size: 70,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
