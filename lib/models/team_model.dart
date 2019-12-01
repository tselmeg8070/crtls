import 'package:banker/models/user_model.dart';

class TeamModel {
  String _id;
  String _title;
  int _amount;
//  int _savings;
  String _deadline;
  List<_User> _members;
//  List<_Transaction> _transactions;
  TeamModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['_id'];
    _title = parsedJson['title'];
    _amount = parsedJson['amount'];
//    _savings = parsedJson['savings'];
    _deadline = parsedJson['deadline'];
    List<_User> temp = [];
    for(int i = 0; i < parsedJson['members']; i++) {
      temp.add(_User(parsedJson['members'][i]));
    }
    _members = temp;
//    List<_Transaction> tempTransaction = [];
//    for(int i = 0; i < parsedJson['transactions']; i++) {
//      tempTransaction.add(_Transaction(parsedJson['transactions'][i]));
//    }
//    _transactions = tempTransaction;
  }
  String get id => _id;
  String get title => _title;
  int get amount => _amount;
  String get deadLine => _deadline;
//  int get saving => _savings;
  List<_User> get members  => _members;
//  List<_Transaction> get transaction => _transactions;
}
class _User {
  String _fname;
  String _lname;
  String _phoneNumber;
  _User(parsedJson) {
    _fname = parsedJson['fname'];
    _lname = parsedJson['lname'];
    _phoneNumber = parsedJson['phone_number'];
  }
  String get fname =>_fname;
  String get lname => _lname;
  String get phoneNumber => _phoneNumber;
}
//class _Transaction {
//  String _id;
//  String _fname;
//  String _lname;
//  int _amount;
//  String _date;
//  _Transaction(parsedJson) {
//    _id = parsedJson['_id'];
//    _fname = parsedJson['fname'];
//    _lname = parsedJson['lname'];
//    _amount = int.parse(parsedJson['amount']);
//    _date = parsedJson['date'];
//  }
//  String get id => _id;
//  String get fname => _fname;
//  String get lname => _lname;
//  int get amount => _amount;
//  String get date => _date;
//}

/**
 * {
 * _id: ObjectID,
 * title: String,
 * amount: int,
 * deadline: Unix timestamp,
 * members: [User Object ID, ]
 * }
*/

/**
 * {
 *  _id: ObjectID,
 *  user_id: ObjectID,
 *  team_id: ObjectID,
 *  amount: int,
 *  date: Unix Time stamp
 * }
*/
