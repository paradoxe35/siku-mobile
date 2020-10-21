import 'package:flutter/material.dart';
import 'package:siku/blocs/event_block.dart';
import 'package:siku/blocs/loader_bloc.dart';
import 'package:siku/blocs/user_block.dart';
import 'package:siku/modules/localstorage.dart';
import 'package:siku/modules/modules.dart';
import 'package:siku/network/http.dart';
import 'package:siku/screens/home.dart';
import 'package:siku/serializable/logged.dart';
import 'package:siku/utils/constants.dart';
import 'package:siku/utils/vars.dart';
import 'package:siku/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:device_info/device_info.dart';

const fieldPadding = const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0);
const textPadding = const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0);
const desciption =
    "If you do not have an account, please contact the administrator of the event concerned, he will then give you access to the siku validation.";

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _username = '';

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return LoaderApp(
      child: Scaffold(
        key: _scaffoldKey,
        // resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 100.0, 0.0, 0.0),
                    child: Text(
                      appName,
                      style: TextStyle(
                        color: Color(0xFF32325D),
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: fieldPadding,
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (String v) {
                      setState(() {
                        _username = v;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryTextColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  ButtonPrimary(
                    label: 'Open a session',
                    onTap: _username.trim().isEmpty ? null : _onSubmit,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            Container(
              padding: textPadding,
              child: Text(
                desciption,
                style: TextStyle(
                  fontSize: 12,
                  color: kTextMutedColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(String value) {
    FlushbarApp.danger(context, value, ' ');
  }

  void _putInStoratage(Logged data) {
    AuthStorage.putToken(data.token);
    AuthStorage.putUser(data.auth);
    EventStorage.putEvent(data.event);
  }

  void _putInAppStore(Logged data) {
    context.read<User>().setUser(data.auth);
    context.read<Event>().setEvent(data.event);
  }

  void _authenticated(Logged data) {
    _putInStoratage(data);
    _putInAppStore(data);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
      (_) => false,
    );
  }

  void _onSubmit() async {
    final loader = context.read<Loader>();
    loader.setLoader();

    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;

    loginUserToken(_username, androidDeviceInfo.device)
        .then((value) => _authenticated(value))
        .catchError((error) => _showMessage(error.toString()))
        .whenComplete(() => loader.unsetLoader());
  }
}
