import 'package:banker/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:banker/models/home_model.dart';

class HomeBloc {
  final _repository = Repository();
  final _homeFetcher = PublishSubject<HomeModel>();

  Observable<HomeModel> get home => _homeFetcher.stream;

  fetchHome(String _token) async {
    HomeModel homeModel = await _repository.fetchHome(_token);
    _homeFetcher.sink.add(homeModel);
  }

  dispose() {
    _homeFetcher.close();
  }
}

final homeBloc = HomeBloc();