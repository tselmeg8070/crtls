import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:banker/models/auth_model.dart';

class AuthApiProvider {
  Client client = Client();
  String url = 'http://192.168.1.9:6000';
  Future<AuthModel> fetchAuthentication(String _phoneNumber, String _password) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonBody = '{"phoneNumber" : "${_phoneNumber}", "password" : "${_password}"}';
    final response = await client.post(url + '/login', headers: headers, body: jsonBody);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return AuthModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to auth post');
    }
  }
}