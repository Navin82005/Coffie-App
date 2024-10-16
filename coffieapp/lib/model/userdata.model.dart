class UserData {
  String _username;
  String _date;

  UserData({required String username, required String date})
      : _username = username,
        _date = date;

  set username(String name) => _username = name;
  set date(String date) => _date = date;

  String get username => _username;
  String get date => _date;
}
