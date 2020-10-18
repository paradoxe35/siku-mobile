import 'package:flutter/foundation.dart';
import 'package:siku/serializable/attends.dart' as e;

class Attends with ChangeNotifier {
  List<e.Attend> _attends = [];

  List<e.Attend> get attends => _attends;

  void setAttends(List<e.Attend> u) {
    _attends = u;
    notifyListeners();
  }

  void preprendAttends(e.Attend u) {
    _attends = [u, ..._attends];
    notifyListeners();
  }
}
