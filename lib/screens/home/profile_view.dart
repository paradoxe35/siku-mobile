import 'package:flutter/material.dart';
import 'package:siku/blocs/event_block.dart';
import 'package:siku/blocs/loader_bloc.dart';
import 'package:siku/blocs/user_block.dart';
import 'package:siku/modules/localstorage.dart';
import 'package:siku/network/http.dart';
import 'package:siku/screens/home/constant.dart';
import 'package:siku/screens/screens.dart';
import 'package:siku/utils/constants.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView();

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final event = context.watch<Event>().event;
    final user = context.watch<User>().user;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: kMarginView,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title(
                title: 'Event Name',
                subtitle: event.name,
              ),
              Title(
                title: 'Event Date',
                subtitle: event.eventDate,
              ),
              Title(
                title: 'Admin Info',
                subtitle: (event.admin != null ? event.admin.email : '') +
                    '\n' +
                    (event.admin != null ? event.admin.phone : ''),
              ),
              Title(
                title: 'User Info',
                subtitle: "${user.name}\n${user.username}\n${user.phone}",
              ),
              Center(
                child: FlatButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => _confirm(),
                      barrierDismissible: false,
                      // barrierColor: Colors.blue,
                    );
                  },
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _confirm() {
    return AlertDialog(
      title: Text('Disconnect'),
      content: Text('Are you sure ?'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('No'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            _disconnect();
          },
          child: Text(
            'Disconnect',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _disconnect() {
    final loader = context.read<Loader>();
    loader.setLoader();
    desconnectUserToken().whenComplete(() {
      _destroyState();
      loader.unsetLoader();
    });
  }

  void _destroyState() {
    AuthStorage.destoyUser();
    AuthStorage.destoyToken();
    EventStorage.destoyEvent();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (_) => false,
    );
  }
}

class Title extends StatelessWidget {
  final String title;
  final String subtitle;
  const Title({
    Key key,
    this.subtitle = '',
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 0),
          title: Text(
            title,
            style: const TextStyle(
              color: kTextMutedColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: kTextMutedColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
