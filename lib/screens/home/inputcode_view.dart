import 'package:flutter/material.dart';
import 'package:siku/network/validation.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  FocusNode myFocusNode;

  String _code = '';

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
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          margin: kMarginView,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.0),
                TextField(
                  controller: _controller,
                  focusNode: myFocusNode,
                  onChanged: (String v) {
                    setState(() {
                      _code = v;
                    });
                  },
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
                  onTap: _code.trim().isEmpty ? null : _validate,
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    validation(context, _code, () {
      _controller.clear();
      setState(() {
        _code = '';
      });
    });
  }
}
