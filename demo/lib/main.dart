import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child:
                  Image.asset(
                    'images/aceso-logo.png',
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child:
                  new RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "START DIAGNOSIS",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  child:
                  Image.asset(
                    'images/aceso-logo-2.png',
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child:
                  new RaisedButton(
                    onPressed: () {

                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "START",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

