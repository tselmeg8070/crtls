import 'package:banker/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:banker/models/auth_model.dart';

class AuthBloc {
  final _repository = Repository();
  final _authFetcher = PublishSubject<AuthModel>();

  Observable<AuthModel> get authUser => _authFetcher.stream;

  fetchAuthentication(String _phoneNumber, String _password) async {
    AuthModel authModel = await _repository.fetchAuthentication(_phoneNumber, _password);
    _authFetcher.sink.add(authModel);
  }

  dispose() {
    _authFetcher.close();
  }
}

final authBloc = AuthBloc();