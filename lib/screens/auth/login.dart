import 'package:flutter/material.dart';
import 'package:banker/blocs/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      resizeToAvoidBottomPadding: true,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenSize.height * 0.1),
          child: ListView(
            children: <Widget>[
              Container(
                height: screenSize.height * 0.3,
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Цахим хаяг'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Нууц үг'),
                ),
              ),
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(18),
                    child: SizedBox(
                      height: 50,
                      child: Container(
                          color: Colors.green,
                          child: RaisedButton(
                            onPressed: () {
                              authBloc.fetchAuthentication(
                                  _phoneNumberController.text,
                                  _passwordController.text);
                            },
                            child: Text(
                              'Нэвтэрч орох'?.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
