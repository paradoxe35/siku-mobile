import 'package:laravel_echo/laravel_echo.dart';
import 'package:siku/utils/vars.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

Echo echo = new Echo({
  'broadcaster': 'socket.io',
  'client': IO.io,
  'host': hostEcho,
});

// echo.channel('App.Event.Validation.3').listen('.validated.guest', (e) {
//     print(e);
//   });
