import 'dart:async';
import 'package:banker/resources/auth_provider.dart';
import 'package:banker/models/auth_model.dart';

class Repository {
  final authApiProvider = AuthApiProvider();
  Future<AuthModel> fetchAuthentication(String _phoneNumber, String _password) {
    return authApiProvider.fetchAuthentication(_phoneNumber, _password);
  }
}