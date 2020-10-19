import 'package:siku/blocs/event_block.dart';
import 'package:siku/blocs/user_block.dart';
import 'package:siku/modules/modules.dart';
import 'package:siku/network/http.dart';

void initFromStorage() {
  AppRequest.setAuthorization(AuthStorage.token);
  User().initUser(AuthStorage.user);
  Event().initEvent(EventStorage.event);
}
