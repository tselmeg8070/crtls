import 'package:flutter/material.dart';
class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: screenSize.height*0.2),
          child: Column(
            children: <Widget>[
              Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.fitHeight,
                    width: screenSize.width*0.5,
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 46.0),
                child: GestureDetector(onTap: () => Navigator.pushNamed(context, '/login'),child: Text('Нэвтрэх', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: GestureDetector(onTap: () => Navigator.pushNamed(context, '/register'), child: Text('Бүртгүүлэх', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}