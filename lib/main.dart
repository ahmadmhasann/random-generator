import 'package:flutter/material.dart';
import './dice.dart';
import './coin.dart';
import './number.dart';
import './list.dart';
import './about.dart';

BuildContext scaffoldContext;
String username = 'Random Generator';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Random Generator',
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Center(
          child: Text('Random Generator', style: TextStyle(

          ),),
        ),
        backgroundColor: Color.fromRGBO(17 , 45, 74, 100),
      ),
      body: Builder(builder: (BuildContext context) {
        scaffoldContext = context;
        return Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/icon.png',
                      height: 200,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) => new number()));
                        },
                        child: Image.asset(
                          'images/numberclk.jpg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) => new list()));
                        },
                        child: Image.asset(
                          'images/listclk.jpg',
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) => new coin()));
                        },
                        child: Image.asset(
                          'images/coinclk.jpg',
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) => new dice()));
                        },
                        child: Image.asset(
                          'images/diceclk.jpg',
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
