import 'package:flutter/material.dart';
import 'package:quoteworld/screens/idioms/idioms.dart';
import 'package:quoteworld/screens/idioms/show_user_idioms_collections.dart';
import 'package:quoteworld/screens/phrase/show_user_phrase_colllection.dart';
import 'package:quoteworld/screens/quotes/show_user_quotes_collection.dart';

import 'drawer.dart';

class TabBarForCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
              Tab(icon: Container(
                      height: 25,
                      child: Image.asset(
                        'assets/phrase.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      )), text: "Phrases"),
              Tab(icon: Icon(Icons.icecream), text: "Idioms"),
              Tab(icon: Icon(Icons.icecream), text: "Idioms")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            QuotesUserCollectionScreen(),
            PhrasesUserCollectionScreen(),
            IdiomsUserCollections(),
            IdiomsScraper()
          ],
        ),
      ),
    );
  }
}
