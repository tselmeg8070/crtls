import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.height*0.1),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.fitHeight,
                width: screenSize.width*0.5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration:
                  InputDecoration(border: OutlineInputBorder(), labelText: 'Цахим хаяг'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration:
                  InputDecoration(border: OutlineInputBorder(), labelText: 'Нууц үг'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}