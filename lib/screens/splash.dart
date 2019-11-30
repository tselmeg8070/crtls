import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/auth'));
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: Container(
          color: Colors.white,
          child: Center(
          child: Container(
              width: screenSize.width*0.5,
              child: Image.asset('assets/logo.png')),
      ),
    ),
        ));
  }
}
