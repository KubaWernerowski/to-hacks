import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    },
    theme: ThemeData(fontFamily: 'Roboto'),
  ));
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
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/aceso-logo-transparent.png"),
            fit: BoxFit.none,
          ),
        ),
        child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    'images/aceso-logo-single.png',
                    width: 350,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 25.0),
                  child: Text(
                    'SELECT YOUR TEST',
                    style: TextStyle(fontSize: 30, letterSpacing: 5),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Navigate to Malaria Upload Image
                      Navigator.pushNamed(context, '/malaria');
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "MALARIA",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Navigate to Malaria Upload Image
                      Navigator.pushNamed(context, '/malaria');
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "PARKINSONS",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Navigate to Malaria Upload Image
                      Navigator.pushNamed(context, '/malaria');
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "SKIN CANCER",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Navigate to Malaria Upload Image
                      Navigator.pushNamed(context, '/malaria');
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "HUNTINGTONS",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Navigate to Malaria Upload Image
                      Navigator.pushNamed(context, '/malaria');
                    },
                    textColor: Colors.white,
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: new Text(
                      "ALZHEIMERS",
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Malaria extends StatefulWidget {
  @override
  _MalariaState createState() => _MalariaState();
}

class _MalariaState extends State<Malaria> {
  final String flaskEndPoint = 'https://763aec28.ngrok.io/image';
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      _uploadIamge();
    });
  }

  void _uploadIamge() async {
    if (_image == null) return;
    String base64Image = base64Encode(_image.readAsBytesSync());
    String fileName = _image.path.split('/').last;

    http.post(flaskEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Malaria Tests'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

            Container
              (
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                '\nMALARIA TESTING',
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container
              (
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                '\nSYMPTOMS MAY INCLUDE:\n\n • SHAKING CHILLS\n • HIGH FEVER\n • PROFUSE SWEATING\n\nUPLOAD AN IMAGE OF A BLOOD CELL:',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.2,
                  letterSpacing: 2,

                ),
              ),
        ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              width:350,
              height: 200,
              child: _image == null ? Text('Select an Image') : Image.file(_image),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
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
