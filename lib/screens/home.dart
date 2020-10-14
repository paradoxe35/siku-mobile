import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:siku/screens/home/Tabs.dart';
import 'package:siku/screens/home/exhibition_bottom_sheet.dart';
import 'package:siku/screens/home/inputcode_view.dart';
import 'package:siku/screens/home/profile_view.dart';
import 'package:siku/screens/home/qrcode_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  final _pageController = PageController();

  int _initialPage = 0;

  void _onPageChanged(int i) {
    setState(() {
      _initialPage = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: _onPageChanged,
            controller: _pageController,
            children: [
              QrCodeView(),
              InputCodeView(),
              ProfileView(),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 20),
                Tabs(
                  index: _initialPage,
                  onPageChanged: (int i) {
                    _pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease,
                    );
                  },
                  tabsLabel: const [
                    'Qr Code',
                    'Input Code',
                    'Profile',
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ExhibitionBottomSheet(
            show: _initialPage != 2,
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'SiKu',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
