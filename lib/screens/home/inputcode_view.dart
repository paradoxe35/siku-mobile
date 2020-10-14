import 'package:flutter/material.dart';
import 'package:siku/screens/home/constant.dart';

class InputCodeView extends StatefulWidget {
  @override
  _InputCodeViewState createState() => _InputCodeViewState();
}

class _InputCodeViewState extends State<InputCodeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: kMarginView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Input Code'),
          ],
        ),
      ),
    );
  }
}
