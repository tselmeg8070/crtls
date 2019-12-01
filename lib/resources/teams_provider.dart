import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:banker/models/teams_model.dart';
import 'package:banker/models/team_model.dart';
import 'package:banker/env.dart';
import 'dart:convert';

class TeamsApiProvider {
  Client client = Client();
  String url = environment['baseUrl'];
  Future<TeamsModel> fetchTeams(String _token) async {
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "${_token}"};
    final response = await client.get(url + '/teamsv2', headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return TeamsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to teams get');
    }
  }
  Future<TeamModel> fetchTeam(String _id) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonStr = '{"_id": "${_id}"}';
    final response = await client.post(url + '/team_info', headers: headers, body: jsonStr);
    if (response.statusCode == 200) {
      return TeamModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to teams get');
    }
  }
}