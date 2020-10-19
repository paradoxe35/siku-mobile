import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarApp {
  static secondary(BuildContext context, String title, String message) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      title: title,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[300],
      ),
      message: message,
      duration: const Duration(seconds: 3),
    )..show(context);
  }

  static success(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      icon: Icon(
        Icons.check,
        size: 28.0,
        color: Colors.blue[300],
      ),
      message: message,
      duration: const Duration(seconds: 3),
    )..show(context);
  }

  static danger(BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      icon: Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red[300],
      ),
      message: message,
      duration: const Duration(seconds: 3),
    )..show(context);
  }
}
