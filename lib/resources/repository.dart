import 'dart:async';
import 'package:banker/models/team_model.dart';
import 'package:banker/resources/auth_provider.dart';
import 'package:banker/models/auth_model.dart';
import 'package:banker/resources/home_provider.dart';
import 'package:banker/models/home_model.dart';
import 'package:banker/resources/teams_provider.dart';
import 'package:banker/models/teams_model.dart';
class Repository {
  final authApiProvider = AuthApiProvider();
  Future<AuthModel> fetchAuthentication(String _phoneNumber, String _password) {
    return authApiProvider.fetchAuthentication(_phoneNumber, _password);
  }
  final homeApiProvider = HomeApiProvider();
  Future<HomeModel> fetchHome(String _token) {
    return homeApiProvider.fetchHome(_token);
  }
  final teamsApiProvider = TeamsApiProvider();
  Future<TeamsModel> fetchTeams(String _token) {
    return teamsApiProvider.fetchTeams(_token);
  }
  Future<TeamModel> fetchTeam(String _id) {
    return teamsApiProvider.fetchTeam(_id);
  }
}