import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/utils/logingindicator,.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';

import '../drawer.dart';

class LastWordsScraper extends StatefulWidget {
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
        drawer: MyDrawer(),
        backgroundColor: Colors.white70.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'Last Words',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
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
                  print(lastWords[index].name);
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
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                      //
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 1),
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
                                              child: Text(
                                                lastWords[index].name,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  fontSize: 30,
                                                  fontFamily: 'Myfont',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Scrollbar(
                                        child: SingleChildScrollView(
                                          dragStartBehavior:
                                              DragStartBehavior.down,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Wrap(
                                          children: [
                                            InkWell(
                                                onTap: () async {
                                                  await flutterTts.speak(
                                                    lastWords[index].lastWords,
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    Icons.volume_up_outlined,
                                                    color: Colors.green,
                                                  ),
                                                )),
                                            InkWell(
                                                onTap: () async {
                                                  // widget.quotesDao
                                                  //     .insertQuote(
                                                  //         quotesList[index]);
                                                  showSnackBar(
                                                    context: context,
                                                    value:
                                                        'Quote is Saved in your Collection',
                                                    icon: Icon(
                                                      Icons.system_update,
                                                      color: Colors.green,
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    Icons.system_update,
                                                    color: Colors.green,
                                                  ),
                                                )),

                                            InkWell(
                                                onTap: () async {
                                                  SocialShare.copyToClipboard(
                                                          '${lastWords[index].lastWords} \n ${lastWords[index].name}')
                                                      .then((data) {
                                                    print(data);
                                                  });
                                                  showSnackBar(
                                                    context: context,
                                                    value:
                                                        'Quote is copied in your clipboard',
                                                    icon: Icon(
                                                      FontAwesomeIcons.copy,
                                                      color: Colors.white,
                                                    ),
                                                  );
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    FontAwesomeIcons.copy,
                                                    color: Colors.white
                                                        .withOpacity(.8),
                                                  ),
                                                )),
                                            InkWell(
                                                onTap: () async {
                                                  SocialShare.shareSms(
                                                          lastWords[index]
                                                              .lastWords,
                                                          trailingText:
                                                              lastWords[index]
                                                                  .name,
                                                          url: '')
                                                      .then((data) {
                                                    print(data);
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    Icons.message,
                                                    color: Colors.blueAccent,
                                                  ),
                                                )),
                                            InkWell(
                                                onTap: () async {
                                                  SocialShare.shareTwitter(
                                                          lastWords[index]
                                                              .lastWords,
                                                          trailingText:
                                                              lastWords[index]
                                                                  .name,
                                                          url: '')
                                                      .then((data) {
                                                    print(data);
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    FontAwesomeIcons.twitter,
                                                    color: Colors.blue,
                                                  ),
                                                )),
                                            InkWell(
                                                onTap: () async {
                                                  SocialShare.shareWhatsapp(
                                                          '${lastWords[index].lastWords} \n ${lastWords[index].name}')
                                                      .then((data) {
                                                    print(data);
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(
                                                    FontAwesomeIcons.whatsapp,
                                                    color: Colors.green,
                                                  ),
                                                )),

                                            //         InkWell(
                                            //             onTap: () async {
                                            //               SocialShare.shareInstagramStory(paths.getApplicationDocumentsDirectory().toString() , "#ffffff",
                                            // "#000000", "https://deep-link-url");
                                            //               // SocialShare.shareInstagramStory(
                                            //               //         '${quotesList[index].quoteContent} \n ${quotesList[index].quoteWriter}')
                                            //               //     .then((data) {
                                            //               //   print(data);
                                            //               // });
                                            //             },
                                            //             child: Padding(
                                            //               padding: const EdgeInsets.symmetric(
                                            //                   horizontal: 10),
                                            //               child: Icon(
                                            //                 FontAwesomeIcons.instagram,

                                            //                 color:Colors.red.withOpacity(0.5),

                                            //               ),
                                            //             )),
                                            InkWell(
                                                onTap: () async {
                                                  SocialShare.shareOptions(
                                                          '${lastWords[index].lastWords} \n ${lastWords[index].name}')
                                                      .then((data) {
                                                    print(data);
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Icon(Icons.share),
                                                )),
                                          ],
                                        ),
                                      ),
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
