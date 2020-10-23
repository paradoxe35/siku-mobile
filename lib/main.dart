import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siku/blocs/event_block.dart';
import 'package:siku/blocs/loader_bloc.dart';
import 'package:siku/blocs/user_block.dart';
import 'package:siku/modules/modules.dart';
import 'package:siku/screens/screens.dart';
import 'package:siku/utils/vars.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Loader>(create: (_) => Loader()),
        ChangeNotifierProvider<User>(create: (_) => User()),
        ChangeNotifierProvider<Event>(create: (_) => Event()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
    return FutureBuilder(
      future: storage.ready,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(color: Colors.white);
        }
        if (AuthStorage.token != null) {
          return const HomePage();
        }
        return const LoginPage();
      },
    );
  }
}
