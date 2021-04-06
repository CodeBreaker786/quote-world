import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  AppBarTitle({Key key, @required this.title}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Colors.white.withOpacity(.8)),
    );
  }
}
