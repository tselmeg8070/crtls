class HomeModel {
  int _income;
  int _outcome;
  int _savings;
  int _availableSavings;
  List<_Outcome> _maxOutcomes;
  HomeModel.fromJson(Map<String, dynamic> jsonParsed) {
    _income =  int.parse(jsonParsed['income']);
    _outcome =  int.parse(jsonParsed['outcome']);
    _savings =  int.parse(jsonParsed['savings']);
    _availableSavings =  int.parse(jsonParsed['available_savings']);
    List<_Outcome> temp = [];
    for(int i = 0; i < jsonParsed['outcomes'].length; i++) {
      temp.add(_Outcome(jsonParsed['outcomes'][i]));
    }
    _maxOutcomes = temp;
  }
  int get income => _income;
  int get outcome => _outcome;
  int get saving => _savings;
  int get availableSavings => _availableSavings;
  List<_Outcome> get maxOutcomes => _maxOutcomes;
}
//
class _Outcome {
  String _title;
  int _amount;
  _Outcome(parsedJson) {
    _title = parsedJson['title'];
    _amount = int.parse(parsedJson['amount']);
  }
  String get title => _title;
  int get amount => _amount;
}