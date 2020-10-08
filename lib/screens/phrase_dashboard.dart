import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/screens/phrase_list_screen.dart';
import 'package:quoteworld/utils/constent.dart';
import 'package:quoteworld/utils/navigation_style.dart';

import 'drawer.dart';
import 'no_internet_screen.dart';

class PhraseScraper extends StatefulWidget {
  @override
  _PhraseScraperState createState() => _PhraseScraperState();
}

class _PhraseScraperState extends State<PhraseScraper> {
  getPhrase() async {
    final url =
        'https://www.phrases.org.uk/meanings/phrases-and-sayings-list.html';
    print(url);
    var response = await http.get(url).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('category');
      print(element[0].getElementsByTagName('a')[0].attributes['href']);
      List<Phrase> categories = List<Phrase>();

      element.forEach((element) {
        categories.add(Phrase(
          phraseTitile: element.getElementsByTagName('a')[0].innerHtml,
          phraseLink:
              '$baseUrl/meanings/${element.getElementsByTagName('a')[0].attributes['href']}',
        ));
      });
      return categories;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.white70.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Phrases',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getPhrase(),
          builder: (context, snashot) {
            if (snashot.hasData) {
              List<Phrase> categories = snashot.data;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  semanticChildCount: 2,
                  children: categories
                      .map((e) => InkWell(
                            onTap: () async {
                              Connectivity().checkConnectivity().then((value) {
                                if (value == ConnectivityResult.none) {
                                  Navigator.push(context,
                                      FadeRoute(page: NoInternetScreen()));
                                } else {
                                  Navigator.push(
                                      context,
                                      SizeRoute(
                                          page: PhraseScreen(
                                        title: e.phraseTitile,
                                        url: e.phraseLink,
                                      )));
                                }
                              });
                            },
                            child: Container(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 7,
                                ),
                                child: Card(
                                  color: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Container(
                                          child: Text(
                                        e.phraseTitile,
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 18,
                                            fontFamily: 'primaryfont',
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
              ),
            );
          }),
    );
  }
}
