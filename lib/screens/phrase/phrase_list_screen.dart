import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/curd/phrases_curd/phrases_curd.dart';
import 'package:quoteworld/screens/phrase/phrase_detail_screen.dart';
import 'package:quoteworld/utils/logingindicator,.dart';
import 'package:quoteworld/utils/navigation_style.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';

class PhraseScreen extends StatefulWidget {
  String title;
  String url;
  PhrasesDao phrasesDao;
  var db;
  PhraseScreen({this.title, this.url}) {
    db = AppDatabase();
    phrasesDao = PhrasesDao(db);
  }
  @override
  _PhraseScreenState createState() => _PhraseScreenState();
}

class _PhraseScreenState extends State<PhraseScreen> {
  getPhrase() async {
    var response = await http.get(widget.url).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('phrase-list');
      // print(element[0].getElementsByTagName('a')[0].attributes['href']);
      List<Phrase> categories = List<Phrase>();

      element.forEach((element) {
        if (element.children.length > 0 &&
            element.children.first.localName == 'a') {
          categories.add(Phrase(
              phraseTitile: element.getElementsByTagName('a')[0].text,
              phraseLink:
                  'https://www.phrases.org.uk/meanings/${element.getElementsByTagName('a')[0].attributes['href']}'));
        }
      });

      return categories;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, data) {
          print(data.data);

          return Scaffold(
              backgroundColor: Colors.white70.withOpacity(0.9),
              appBar: AppBar(
                backgroundColor: Colors.grey,
                title: Text(widget.title),
                actions: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: data.data == ConnectivityResult.none
                          ? Icon(
                              Icons.signal_wifi_off,
                              color: Colors.red,
                            )
                          : Icon(Icons.wifi, color: Colors.greenAccent))
                ],
              ),
              body: FutureBuilder(
                  future: getPhrase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Phrase> phrasesList = snapshot.data;
                      return ListView.builder(
                          itemCount: phrasesList.length,
                          itemBuilder: (context, index) =>

                              // Don't trigger if one async loading is already under way
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      SizeRoute(
                                          page: PhraseDetailScreen(
                                              detailUrl: phrasesList[index]
                                                  .phraseLink)));
                                },
                                child: Card(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              phrasesList[index].phraseTitile,
                                              style: TextStyle(
                                                  fontFamily: 'myfont',
                                                  fontSize: 24),
                                            ),
                                            subtitle:
                                                Text('Click for phrase origin'),
                                            trailing:
                                                Icon(Icons.arrow_forward_ios),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                    onTap: () async {
                                                      await widget.phrasesDao
                                                          .insertPhrase(
                                                              phrasesList[
                                                                  index]);
                                                      showSnackBar(
                                                        context: context,
                                                        value:
                                                            'Phrase is Saved in your Collection',
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
                                                              phrasesList[index]
                                                                  .phraseTitile)
                                                          .then((data) {
                                                        print(data);
                                                      });
                                                      showSnackBar(
                                                        context: context,
                                                        value:
                                                            'Quote is copied in your clipboard',
                                                        icon: Icon(
                                                          FontAwesomeIcons.copy,
                                                        ),
                                                      );
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Icon(
                                                        FontAwesomeIcons.copy,
                                                        //color: Colors.white,
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () async {
                                                      SocialShare.shareSms(
                                                              phrasesList[index]
                                                                  .phraseTitile,
                                                              trailingText:
                                                                  phrasesList[
                                                                          index]
                                                                      .phraseTitile,
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
                                                        color:
                                                            Colors.blueAccent,
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () async {
                                                      SocialShare.shareTwitter(
                                                              phrasesList[index]
                                                                  .phraseTitile,
                                                              trailingText:
                                                                  phrasesList[
                                                                          index]
                                                                      .phraseTitile,
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
                                                        FontAwesomeIcons
                                                            .twitter,
                                                        color: Colors.blue,
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () async {
                                                      SocialShare.shareWhatsapp(
                                                              phrasesList[index]
                                                                  .phraseTitile)
                                                          .then((data) {
                                                        print(data);
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .whatsapp,
                                                        color: Colors.green,
                                                      ),
                                                    )),
                                                InkWell(
                                                    onTap: () async {
                                                      SocialShare.shareOptions(
                                                              phrasesList[index]
                                                                  .phraseTitile)
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
                                          )
                                        ],
                                      ),
                                    )),
                              ));
                    }
                    return LodingIndicator();
                  }));
        });
  }
}
