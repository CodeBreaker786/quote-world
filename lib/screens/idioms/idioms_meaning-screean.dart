import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/models/idioms_detail.dart';
import 'package:quoteworld/utils/logingindicator,.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';

class IdiomsMeaningScraper extends StatefulWidget {
  String url;
  IdiomsMeaningScraper({this.url});
  @override
  _IdiomsMeaningScraperState createState() => _IdiomsMeaningScraperState();
}

class _IdiomsMeaningScraperState extends State<IdiomsMeaningScraper> {
  FlutterTts flutterTts = FlutterTts();
  getIdioms() async {
    var response = await http.get(widget.url).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('idiom-container');

      element.forEach((element) {});
      return IdiomDetail(
        idiom: element[0].getElementsByClassName('idiom')[0].text,
        meaning:
            element[0].getElementsByClassName('idiom-meaning')[0].innerHtml,
        examples: element[0].getElementsByClassName('idiom-example')[0].text,
        whereOriginate:
            element[0].getElementsByClassName('idiom-example')[1].text,
        whereUsed: element[0].getElementsByClassName('idiom-example')[2].text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'Idom Deatail',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        body: FutureBuilder(
            future: getIdioms(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                IdiomDetail idioms = snapshot.data;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              constraints: BoxConstraints(minHeight: 100),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.grey.withOpacity(0.4),
                              ),
                              //
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  idioms.idiom,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Myfont',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 8),
                                        child: Text(
                                          'Meaning',
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        constraints:
                                            BoxConstraints(minHeight: 100),
                                        decoration: BoxDecoration(
                                            // borderRadius:
                                            //     BorderRadius.circular(5.0),

                                            ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            idioms.meaning,
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 8),
                                        child: Text(
                                          'Examples',
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        constraints: BoxConstraints(
                                            minHeight: 100,
                                            minWidth: double.infinity),
                                        decoration: BoxDecoration(
                                            // borderRadius:
                                            //     BorderRadius.circular(5.0),

                                            ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            idioms.examples,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 8),
                                        child: Text(
                                          'Where did it originate?',
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        constraints: BoxConstraints(
                                            minHeight: 100,
                                            minWidth: double.infinity),
                                        decoration: BoxDecoration(
                                            // borderRadius:
                                            //     BorderRadius.circular(5.0),

                                            ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            idioms.whereOriginate,
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 8),
                                        child: Text(
                                          'Where is it used?',
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        constraints: BoxConstraints(
                                            minHeight: 100,
                                            minWidth: double.infinity),
                                        decoration: BoxDecoration(
                                            // borderRadius:
                                            //     BorderRadius.circular(5.0),

                                            ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            idioms.whereUsed,
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
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          await flutterTts.speak(
                                            idioms.meaning,
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            Icons.volume_up_outlined,
                                            color: Colors.green,
                                          ),
                                        )),
                                   

                                    InkWell(
                                        onTap: () async {
                                          SocialShare.copyToClipboard(
                                                  '${idioms.idiom}')
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            FontAwesomeIcons.copy,
                                            color: Colors.white.withOpacity(.8),
                                          ),
                                        )),
                                    InkWell(
                                        onTap: () async {
                                          SocialShare.shareSms(idioms.idiom,
                                                  trailingText: '', url: '')
                                              .then((data) {
                                            print(data);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            Icons.message,
                                            color: Colors.blueAccent,
                                          ),
                                        )),
                                    InkWell(
                                        onTap: () async {
                                          SocialShare.shareTwitter(idioms.idiom,
                                                  trailingText: '', url: '')
                                              .then((data) {
                                            print(data);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            FontAwesomeIcons.twitter,
                                            color: Colors.blue,
                                          ),
                                        )),
                                    InkWell(
                                        onTap: () async {
                                          SocialShare.shareWhatsapp(
                                                  '${idioms.idiom}')
                                              .then((data) {
                                            print(data);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
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
                                                  '${idioms.idiom}')
                                              .then((data) {
                                            print(data);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
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
              }
              return LodingIndicator();
            }));
  }
}
