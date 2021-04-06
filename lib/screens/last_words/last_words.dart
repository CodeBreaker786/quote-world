import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/lastWord_curd/lastword_curd.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/utils/logingindicator.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:quoteworld/widgets/appbar_tiltle.dart';
import 'package:quoteworld/widgets/linear_gragient.dart';
import 'package:quoteworld/widgets/social_share.dart';
import 'package:social_share/social_share.dart';

import '../drawer.dart';

class LastWordsScraper extends StatefulWidget {
  LastWordsDao lastWordsDao;
  var db;
  LastWordsScraper() {
    db = AppDatabase();
    lastWordsDao = LastWordsDao(db);
  }

  @override
  _LastWordsScraperState createState() => _LastWordsScraperState();
}

class _LastWordsScraperState extends State<LastWordsScraper> {
  FlutterTts flutterTts = FlutterTts();
  getLastWords() async {
    final url = 'https://www.phrases.org.uk/famous-last-words/index.html';
    print(url);
    var response = await http.get(url).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('row story');

      List<LastWord> lastWords = List<LastWord>();

      element.forEach((element) {
        print(
          element.getElementsByTagName('a')[0].innerHtml,
        );

        lastWords.add(LastWord(
            name: element
                .getElementsByClassName(
                    'col-xs-4 col-sm-2 bigger space-above')[0]
                .getElementsByTagName('a')[0]
                .text,
            deathAndBirthDates: element
                .getElementsByClassName(
                    'col-xs-4 col-sm-2 bigger space-above')[0]
                .text,
            lastWords: element.getElementsByClassName('emphasize')[0].text,
            lastWordsReceiver: element.getElementsByClassName('said')[0].text));
      });
      return lastWords;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.9),
        appBar: AppBar(
            backgroundColor: Colors.amber,
            title: AppBarTitle(
              title: 'Last Words',
            )),
        body: Container(
          child: FutureBuilder(
              future: getLastWords(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  List<LastWord> lastWords = snapshot.data;

                  return ListView.builder(
                      itemCount: lastWords.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 50),
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 50,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          gradient: myGradient()),
                                      //
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 0),
                                            width: 100,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(15))),
                                            child: lastWords[index].imageLink !=
                                                    null
                                                ? Image.network(
                                                    lastWords[index].imageLink,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.asset(
                                                    'assets/person.jpg'),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                lastWords[index].name,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white,
                                                  fontFamily: 'Myfont',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.amber.shade100,
                                        child: Scrollbar(
                                          child: SingleChildScrollView(
                                            dragStartBehavior:
                                                DragStartBehavior.down,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    lastWords[index].lastWords,
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontFamily: 'Myfont'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SocialShareRow(
                                      content: lastWords[index].lastWords,
                                      type: 'Last Words',
                                      ontap: () async {
                                        widget.lastWordsDao
                                            .insertLastWord(lastWords[index]);
                                        showSnackBar(
                                          context: context,
                                          value:
                                              'Last words is Saved in your Collection',
                                          icon: Icon(
                                            Icons.system_update,
                                            color: Colors.greenAccent,
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )),
                        );
                      });
                }
                return LodingIndicator();
              }),
        ));
  }
}
