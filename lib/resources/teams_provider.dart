import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:banker/models/teams_model.dart';
import 'package:banker/env.dart';
import 'dart:convert';

class TeamsApiProvider {
  Client client = Client();
  String url = environment['baseUrl'];
  Future<TeamsModel> fetchTeams(String _token) async {
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "${_token}"};
    final response = await client.get(url + '/teams', headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TeamsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to teams get');
    }
  }
}