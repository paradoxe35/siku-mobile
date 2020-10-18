import 'package:flutter/material.dart';
import 'package:siku/screens/home/constant.dart';

class ProfileView extends StatefulWidget {
  const ProfileView();

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: kMarginView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile'),
          ],
        ),
      ),
    );
  }
}
