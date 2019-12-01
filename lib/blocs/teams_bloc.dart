import 'package:banker/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:banker/models/teams_model.dart';

class TeamsBloc {
  final _repository = Repository();
  final _teamFetcher = PublishSubject<TeamsModel>();

  Observable<TeamsModel> get teams => _teamFetcher.stream;

  fetchTeams(String _token) async {
    TeamsModel teamsModel = await _repository.fetchTeams(_token);
    _teamFetcher.sink.add(teamsModel);
  }

  dispose() {
    _teamFetcher.close();
  }
}

final teamsBloc = TeamsBloc();