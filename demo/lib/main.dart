import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(MaterialApp(
      title: 'Navigation Basics',
      home: Home(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => Home());
            break;
          case '/tests':
            return MaterialPageRoute(builder: (context) => Tests());
            break;
          case '/malaria':
            return MaterialPageRoute(builder: (context) => Malaria());
            break;
        }
      }));
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/aceso-logo.png',
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tests');
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
          ],
        ),
      ),
    ));
  }
}

class Tests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/aceso-logo-2.png',
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // Navigate back to Home
                      Navigator.pop(context);
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      // Navigate to Malaria Upload Image
                      Navigator.pushNamed(context, '/malaria');
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "Malaria",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Malaria extends StatefulWidget {
  @override
  _MalariaState createState() => _MalariaState();
}

class _MalariaState extends State<Malaria> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Malaria Tests'),
      ),
      body: Center(
        child: _image == null ? Text('Select an Image') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
    // raisedButton: RaisedButton(
    //       onPressed: () {
    //         // Navigate back to HomeScreen
    //         Navigator.pop(context);
    //       },
    //       child: Text('Back to Tests'),
    //     ),
    // );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return new SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
