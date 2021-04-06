import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showSnackBar({context, String value, Icon icon}) {
  Flushbar(
    margin: EdgeInsets.all(8),
    borderRadius: 8,
    message: value,
    duration: Duration(seconds: 3),
    backgroundColor: Colors.red,
    backgroundGradient:
        LinearGradient(colors: [Colors.amber, Colors.amber.shade100]),
    icon: icon,
    boxShadows: [
      BoxShadow(
        color: Colors.white,
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      )
    ],
  )..show(context);
}
