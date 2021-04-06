import 'package:flutter/material.dart';
import 'package:quoteworld/screens/idioms/idioms.dart';
import 'package:quoteworld/screens/idioms/show_user_idioms_collections.dart';
import 'package:quoteworld/screens/last_words/user_last_words_collections.dart';
import 'package:quoteworld/screens/phrase/show_user_phrase_colllection.dart';
import 'package:quoteworld/screens/quotes/show_user_quotes_collection.dart';
import 'package:quoteworld/widgets/appbar_tiltle.dart';

import 'drawer.dart';

class TabBarForCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: AppBarTitle(
            title: 'Your Collection',
          ),
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
              Tab(
                  icon: Container(
                      height: 25,
                      child: Image.asset(
                        'assets/phrase.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      )),
                  text: "Phrases"),
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
            LastWordsUserCollectionScreen()
          ],
        ),
      ),
    );
  }
}
