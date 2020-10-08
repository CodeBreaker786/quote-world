import 'package:flutter/material.dart';
import 'package:quoteworld/screens/phrases_collection_screen.dart';
import 'package:quoteworld/screens/show_user_collection.dart';

import 'drawer.dart';

class TabBarForCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Your Collection'),
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Container(
                      height: 25,
                      child: Image.asset(
                        'assets/logo3.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      )),
                  text: "Quotes"),
              Tab(icon: Icon(Icons.camera_alt), text: "Phrases")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            QuotesUserCollectionScreen(),
            PhrasesUserCollectionScreen(),
          ],
        ),
      ),
    );
  }
}
