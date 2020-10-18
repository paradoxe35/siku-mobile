import 'package:flutter/material.dart';
import 'package:siku/blocs/attends_block.dart';
import 'package:siku/utils/constants.dart';
import 'package:provider/provider.dart';

class SheetCounterGuests extends StatelessWidget {
  const SheetCounterGuests({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.02),
      child: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white24),
                shape: BoxShape.circle,
              ),
              child: Text(
                context.watch<Attends>().attends.length.toString(),
                style: TextStyle(
                  color: kTextLightColor,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Validés',
              style: TextStyle(
                fontSize: 12,
                color: kTextMutedColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
