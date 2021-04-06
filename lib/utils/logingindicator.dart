import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LodingIndicator extends StatefulWidget {
  @override
  _LodingIndicatorState createState() => _LodingIndicatorState();
}

class _LodingIndicatorState extends State<LodingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Platform.isIOS
              ? CupertinoActivityIndicator(
                  animating: true,
                  radius: 15,
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.amber.shade100,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                ),
        ),
      ),
    );
  }
}
