import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:banker/env.dart';
import 'package:banker/models/auth_model.dart';

class CreateTeamView extends StatefulWidget {
  final AsyncSnapshot<AuthModel> snapshot;
  CreateTeamView({this.snapshot});
  _CreateTeamViewState createState() => _CreateTeamViewState();
}

class _CreateTeamViewState extends State<CreateTeamView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _phoneNumbersController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _phoneNumbersController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    String _url = environment['baseUrl'];
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 50,
            child: Container(
              color: Colors.white,
              child: RaisedButton(
                color: Colors.blueAccent[100],
                onPressed:  () async {
                  String url = _url +'/create_team';
                  Map<String, String> headers = {"Content-type": "application/json", "Authentication": widget.snapshot.data.token};
                  String json = '{"title": "${_titleController.text}", "amount": "${_amountController.text}", "phone_numbers": "${_phoneNumbersController.text}"}';
                  Response response = await post(url, headers: headers, body: json);
                  print(json);
//                  Navigator.pop(context);
                },
                child:
                const Text('Баг үүсгэх', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Баг үүсгэх',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            color: Colors.white,
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Нэр'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
                  child: TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Хэмжээ'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 18.0, right: 18.0),
                  child: TextFormField(
                    controller: _phoneNumbersController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Гишүүд'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
