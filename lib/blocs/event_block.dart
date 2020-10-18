import 'package:flutter/foundation.dart';
import 'package:siku/serializable/event.dart' as e;

var $event;

class Event with ChangeNotifier {
  e.Event _event = $event;

  e.Event get event => _event;

  void setEvent(e.Event u) {
    _event = u;
    notifyListeners();
  }

  void initEvent(e.Event u) {
    $event = u;
  }

  void unsetEvent() {
    _event = null;
    notifyListeners();
  }
}
