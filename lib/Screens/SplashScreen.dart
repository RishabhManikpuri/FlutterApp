import 'package:flutter/material.dart';
import 'dart:async';
import 'HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen()); // define it once at root level.
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => DemoList()), (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Colors.purple, Colors.blue[900]])),
        child: Center(
          child: Text(
            "R",
            style: TextStyle(shadows: <Shadow>[
              Shadow(
                offset: Offset(20.0, 10.0),
                blurRadius: 3.0,
                color: Colors.purple,
              ),
              Shadow(
                offset: Offset(20.0, 10.0),
                blurRadius: 10.0,
                color: Colors.deepPurple,
              ),
            ], fontStyle: FontStyle.italic, fontSize: 200, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
