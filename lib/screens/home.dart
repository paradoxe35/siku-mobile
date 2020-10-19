import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:siku/blocs/attends_block.dart';
import 'package:siku/blocs/event_block.dart';
import 'package:siku/blocs/init_from_storage.dart';
import 'package:siku/blocs/user_block.dart';
import 'package:siku/modules/modules.dart';
import 'package:siku/network/http.dart';
import 'package:siku/screens/home/Tabs.dart';
import 'package:siku/screens/home/exhibition_bottom_sheet.dart';
import 'package:siku/screens/home/inputcode_view.dart';
import 'package:siku/screens/home/profile_view.dart';
import 'package:siku/screens/home/qrcode_view.dart';
import 'package:siku/serializable/user.dart' as auth;
import 'package:siku/serializable/event.dart' as authEvent;
import 'package:siku/utils/constants.dart';
import 'package:siku/utils/vars.dart';
import 'package:provider/provider.dart';
import 'package:siku/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey qrKey = GlobalKey();
  QRViewController controller;
  final _pageController = PageController();

  int _indexPage = 0;

  final tabsLabel = const [
    'Qr Code',
    'Input Code',
    'Profile',
  ];

  bool fetchedAttends = false;

  void _onPageChanged(int i) {
    setState(() {
      _indexPage = i;
    });
  }

  void _putInStorage(authEvent.Event event, auth.User user) {
    AuthStorage.putUser(user);
    EventStorage.putEvent(event);
    context.read<User>().setUser(user);
    context.read<Event>().setEvent(event);
  }

  void _refreshData() async {
    Future.wait([fetchAuth(), fetchWorkingEvent()]).then((value) {
      final authEvent.Event event = value[1];
      final auth.User user = value[0];
      _putInStorage(event, user);
    });
  }

  @override
  void initState() {
    initFromStorage();
    _refreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderApp(
      child: ChangeNotifierProvider(
        create: (_) => Attends(),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Builder(
            builder: (context) {
              if (!fetchedAttends) {
                fetchAttends(EventStorage.event.hash).then((value) {
                  context.read<Attends>().setAttends(value);
                });
                fetchedAttends = true;
              }
              return Stack(
                children: <Widget>[
                  PageView(
                    onPageChanged: _onPageChanged,
                    controller: _pageController,
                    children: [
                      const QrCodeView(),
                      InputCodeView(
                        canFocus: _indexPage == 1,
                      ),
                      const ProfileView(),
                    ],
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 8),
                        const Header(),
                        const SizedBox(height: 10),
                        Tabs(
                          index: _indexPage,
                          onPageChanged: (int i) {
                            _pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.ease,
                            );
                          },
                          tabsLabel: tabsLabel,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  ExhibitionBottomSheet(
                    show: _indexPage != tabsLabel.length - 1,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        appName,
        style: TextStyle(
          color: kTextMutedColor,
          fontSize: 37,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
