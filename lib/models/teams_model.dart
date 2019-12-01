class TeamsModel {
  List<_Team> _teams;
  TeamsModel.fromJson(Map<String, dynamic> parsedJson) {
    List<_Team> temp = [];
    for(int i = 0; i < parsedJson['teams'].length; i++) {
      temp.add(_Team(parsedJson['teams'][i]));
    }
    _teams = temp;
  }
  List<_Team> get teams => _teams;
}

class _Team {
  String _id;
  String _title;
  String _deadline;
  int _progress;
  int _amount;
  _Team(parsedJson) {
    _id = parsedJson['_id'];
    _title = parsedJson['title'];
    _progress = int.parse(parsedJson['progress']);
    _amount = int.parse(parsedJson['amount']);
    _deadline = parsedJson['deadline'];
  }
  String get id => _id;
  String get title => _title;
  int get progress => _progress;
  int get amount => _amount;
  String get deadline => _deadline;
}

/**
 * {
 *  teams: [
 *    {_id: (String), title: (String), progress: (int 0 to 100), deadline: (String), amount: (int)},
 *    {_id: (String), title: (String), progress: (int 0 to 100), deadline: (String), amount: (int)},
 *    {_id: (String), title: (String), progress: (int 0 to 100), deadline: (String), amount: (int)},
 *    {_id: (String), title: (String), progress: (int 0 to 100), deadline: (String), amount: (int)},
 *  ]
 * }
*/