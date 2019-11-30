import 'package:banker/models/user_model.dart';
class AuthModel {
  String _token;
  UserModel _user;
  AuthModel.fromJson(Map<String, dynamic> jsonParsed) {
    _token = jsonParsed['token'];
    _user = UserModel(jsonParsed['user']);
  }
  UserModel get user => _user;
  String get token => _token;
}
