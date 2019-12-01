import 'package:banker/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:banker/models/teams_model.dart';
import 'package:banker/models/team_model.dart';

class TeamsBloc {
  final _repository = Repository();
  final _teamsFetcher = PublishSubject<TeamsModel>();
  Observable<TeamsModel> get teams => _teamsFetcher.stream;

  fetchTeams(String _token) async {
    TeamsModel teamsModel = await _repository.fetchTeams(_token);
    _teamsFetcher.sink.add(teamsModel);
  }

  dispose() {
    _teamsFetcher.close();
  }
}

class TeamBloc {
  final _repository = Repository();
  final _teamFetcher = PublishSubject<TeamModel>();
  Observable<TeamModel> get teams => _teamFetcher.stream;

  fetchTeam(String _id) async {
    TeamModel teamsModel = await _repository.fetchTeam(_id);
    _teamFetcher.sink.add(teamsModel);
  }

  dispose() {
    _teamFetcher.close();
  }
}

final teamBloc = TeamBloc();
final teamsBloc = TeamsBloc();