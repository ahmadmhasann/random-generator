import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'dart:core';

class list extends StatefulWidget {
  final String text;
  list({@required this.text});

  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  int rand = 0;
  List<String> generatedItems = new List(1000);
  int generatedCounter = 0;
  TextEditingController itemsController = new TextEditingController();
  String items = '';
  int numberOfItems = 0;
  String output = '';
  String repeatCounter = '';
  bool repeat = true;
  LineSplitter ls = new LineSplitter();

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
          child: Text('List Items', style: TextStyle(

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
                  'Enter each item in new line',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 30.0,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.all(25.0),
                  width: double.infinity,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: itemsController,
                    style: TextStyle(
                      fontFamily: 'Oswald',
                      fontSize: 20.0,
                      color: Colors.black87,
                    ),
                    onChanged: (text) {
                      items = text;
                      generatedCounter = 0;
                      generatedItems = ls.convert(items);
                      setState(() {
                        numberOfItems = generatedItems.length;
                        repeatCounter = numberOfItems >= 0
                            ? '$generatedCounter/$numberOfItems'
                            : '';
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Items',
                      hintText: 'apple\norange\ncherry',
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
                    color: repeat ? Colors.black87 : Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  padding: EdgeInsets.all(25.0),
                  onPressed: () {
                    if (numberOfItems < 2) {
                      output = 'Please enter at least two items';
                    } else {
                      if (!repeat) {
                        rand = Random().nextInt(numberOfItems);
                        output = generatedItems[rand];
                        generatedCounter++;
                      } else {
                        if (generatedCounter == numberOfItems) {
                          generatedCounter = 0;
                        }
                        if (generatedCounter == 0) {
                          generatedItems.shuffle();
                        }
                        output = generatedItems[generatedCounter];
                        generatedCounter++;
                        setState(() {
                          repeatCounter = '$generatedCounter/$numberOfItems';
                        });
                      }
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
                              fontSize: 30,
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
