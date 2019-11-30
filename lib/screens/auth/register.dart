import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController idNumberController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    fnameController.dispose();
    lnameController.dispose();
    idNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text('Бүртгүүлэх'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 28),
                width: screenSize.width * 0.7,
                height: screenSize.height * 0.2,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.fitHeight,
                )),
            first(),
            Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: SizedBox(
                    height: 50,
                    child: Container(
                        color: Colors.green,
                        child: RaisedButton(
                          onPressed:  () async {
                            String url = 'http://192.168.1.9:6000/register';
                            Map<String, String> headers = {"Content-type": "application/json"};
                            String json = '{"fname": "${fnameController.text}", "lname": "${lnameController.text}", "phone_number": "${phoneNumberController.text}", "email": "${emailController.text}", "password": "${passwordController.text}", "id_number": "${idNumberController.text}"}';
                            Response response = await post(url, headers: headers, body: json);
                            print(json);
                          },
                          child: Text(
                            'Бүртгүүлэх'?.toUpperCase(),
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
    );
  }

  Widget first() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
          child: TextFormField(
            controller: fnameController,
            decoration:
                InputDecoration(border: OutlineInputBorder(), labelText: 'Нэр'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
          child: TextFormField(
            controller: lnameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Овог'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
          child: TextFormField(
            controller: idNumberController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Регистрийн дугаар'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
          child: TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Утасны дугаар'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Цахим хаяг'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
          child: TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Нууц үг'),
          ),
        ),
      ],
    );
  }
}
