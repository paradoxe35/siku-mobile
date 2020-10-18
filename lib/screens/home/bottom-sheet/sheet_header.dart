import 'package:flutter/material.dart';
import 'package:siku/blocs/user_block.dart';
import 'package:siku/utils/constants.dart';
import 'package:provider/provider.dart';

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        context.select((User value) => value.user.name),
        style: TextStyle(
          color: kTextLightColor,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
