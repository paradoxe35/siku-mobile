import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:siku/blocs/event_block.dart';
import 'package:siku/blocs/loader_bloc.dart';
import 'package:siku/blocs/user_block.dart';
import 'package:siku/modules/modules.dart';
import 'package:siku/network/http.dart';
import 'package:siku/screens/screens.dart';
import 'package:siku/utils/vars.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Loader()),
        ChangeNotifierProvider(create: (_) => User()),
        ChangeNotifierProvider(create: (_) => Event()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const InitApp(),
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: context.watch<Loader>().isLoading,
      progressIndicator: spinkitCircle,
      child: FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(color: Colors.white);
          }
          if (AuthStorage.token != null) {
            _initFromStorage();
            return const HomePage();
          }

          return const LoginPage();
        },
      ),
    );
  }

  void _initFromStorage() {
    AppRequest.setAuthorization(AuthStorage.token);
    User().initUser(AuthStorage.user);
    Event().initEvent(EventStorage.event);
  }
}
