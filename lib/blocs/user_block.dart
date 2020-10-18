import 'package:flutter/foundation.dart';
import 'package:siku/serializable/user.dart' as s;

var $user;

class User with ChangeNotifier {
  s.User _user = $user;

  s.User get user => _user;

  void setUser(s.User u) {
    _user = u;
    notifyListeners();
  }

  void initUser(s.User u) {
    $user = u;
  }

  void unsetUser() {
    _user = null;
    notifyListeners();
  }
}
