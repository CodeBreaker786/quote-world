import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ListTile(
          //   onTap: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Speak()));
          //   },
          //   trailing: Icon(Icons.volume_down),
          // )
        ],
      ),
    );
  }
}
