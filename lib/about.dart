
import 'package:flutter/material.dart';


class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}

class _aboutState extends State<about> {

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  'lol msh 3aref akteb eih hena',
                  style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: 35.0,
                    color: Colors.black,

                    //fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ],
          ),
        );
      }),


    );
  }
}
