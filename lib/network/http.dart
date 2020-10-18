import 'package:dio/dio.dart';
import 'package:siku/serializable/attends.dart';
import 'package:siku/serializable/event.dart';
import 'package:siku/serializable/logged.dart';
import 'package:siku/serializable/user.dart';
import 'package:siku/utils/vars.dart';
import 'package:connectivity/connectivity.dart';

final Map<String, String> commonHeader = {
  "Authorization": '',
  'X-Requested-With': 'XMLHttpRequest',
  'CLIENT-LANG': 'en'
};

BaseOptions options = new BaseOptions(
    baseUrl: "$host/api/mobile",
    connectTimeout: 30000,
    receiveTimeout: 30000,
    headers: {...commonHeader});

Dio dio = Dio(options);

class AppRequest {
  static setAuthorization(String token) {
    commonHeader['Authorization'] = 'Bearer $token';
    dio.options.headers = commonHeader;
  }
}

Future fetch(Function cb) async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    throw "You're offline";
  }

  try {
    return await cb();
  } catch (e) {
    return Future.error(e);
  }
}

Future<Logged> loginUserToken(String username, String deviceName) async {
  return await fetch(() async {
    try {
      Response res = await dio.post("/token", data: {
        "username": username,
        "device_name": deviceName,
      });
      return Logged.fromJson(res.data);
    } on DioError catch (e) {
      if (e.response != null) {
        final errors = e.response.data['errors'];
        throw errors['username'][0];
      } else {
        throw e.message;
      }
    }
  });
}

Future desconnectUserToken(String username, String deviceName) async {
  return await fetch(() async {
    try {
      Response res = await dio.post("/destroy-token");
      return Logged.fromJson(res.data);
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response.data['message'];
      } else {
        throw e.message;
      }
    }
  });
}

Future<Event> fetchWorkingEvent() async {
  return await fetch(() async {
    try {
      Response res = await dio.get("/event");
      return Event.fromJson(res.data);
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response.data['message'];
      } else {
        throw e.message;
      }
    }
  });
}

Future<User> fetchAuth() async {
  return await fetch(() async {
    try {
      Response res = await dio.get("/user");
      return (UserData.fromJson(res.data)).data;
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response.data['message'];
      } else {
        throw e.message;
      }
    }
  });
}

Future<List<Attend>> fetchAttends(String eventHash) async {
  return await fetch(() async {
    try {
      Response res = await dio.get("/$eventHash/attends");
      return (Attends.fromJson(res.data)).data;
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response.data['message'];
      } else {
        throw e.message;
      }
    }
  });
}
