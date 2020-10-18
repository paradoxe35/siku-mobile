import 'package:localstorage/localstorage.dart';
import 'package:siku/serializable/event.dart';
import 'package:siku/serializable/user.dart';

final LocalStorage storage = new LocalStorage('siku_app');

class AuthStorage {
  static String tokenKey = 'auth_token';

  static String authUserKey = 'auth_user';

  static String get token => storage.getItem(tokenKey);

  static void putToken(String $token) {
    storage.setItem(tokenKey, $token);
  }

  static void destoyToken() {
    storage.deleteItem(tokenKey);
  }

  static User get user => User.fromJson(storage.getItem(authUserKey));

  static void putUser(User $user) {
    storage.setItem(authUserKey, $user.toJson());
  }

  static void destoyUser() {
    storage.deleteItem(authUserKey);
  }
}

class EventStorage {
  static String eventKey = 'working_event';

  static Event get event => Event.fromJson(storage.getItem(eventKey));

  static void putEvent(Event $event) {
    storage.setItem(eventKey, $event.toJson());
  }

  static void destoyEvent() {
    storage.deleteItem(eventKey);
  }
}
