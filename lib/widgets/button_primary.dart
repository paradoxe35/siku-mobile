import 'package:flutter/material.dart';
import 'package:siku/screens/home/constant.dart';

class ButtonPrimary extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const ButtonPrimary({Key key, this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        color: tPrimaryColor,
        elevation: 7.0,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
