import 'package:flutter/material.dart';

class LodingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
          ),
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}