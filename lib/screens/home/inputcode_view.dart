import 'package:flutter/material.dart';
import 'package:siku/screens/home/constant.dart';
import 'package:siku/utils/constants.dart';
import 'package:siku/widgets/widgets.dart';

class InputCodeView extends StatefulWidget {
  final bool canFocus;

  const InputCodeView({Key key, this.canFocus}) : super(key: key);

  @override
  _InputCodeViewState createState() => _InputCodeViewState();
}

class _InputCodeViewState extends State<InputCodeView> {
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant InputCodeView oldWidget) {
    if (!widget.canFocus && myFocusNode.hasFocus) myFocusNode.unfocus();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: kMarginView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0),
            TextField(
              focusNode: myFocusNode,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Autorization Code',
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
              label: 'Validate',
              onTap: () {},
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
