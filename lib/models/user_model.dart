class UserModel {
  String _id;
  String _fname;
  String _lname;
  String _phoneNumber;
  String _idNumber;
  String _email;
  UserModel(parsedJson) {
    _id = parsedJson['id'];
    _fname = parsedJson['fname'];
    _lname = parsedJson['lname'];
    _phoneNumber = parsedJson['phone_number'];
    _idNumber = parsedJson['id_number'];
    _email = parsedJson['email'];
  }
  String get id => _id;
  String get fname => _fname;
  String get lname => _lname;
  String get phoneNumber => _phoneNumber;
  String get idNumber => _idNumber;
  String get email => _email;
}