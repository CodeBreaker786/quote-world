import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/curd/phrases_curd/phrases_curd.dart';

import 'package:quoteworld/models/quote_detail.dart';
import 'package:quoteworld/utils/logingindicator.dart';

import 'package:quoteworld/utils/snak_bar.dart';
import 'package:quoteworld/widgets/appbar_tiltle.dart';
import 'package:quoteworld/widgets/social_share.dart';
import 'package:social_share/social_share.dart';

class PhraseDetailScreen extends StatelessWidget {
  FlutterTts flutterTts = FlutterTts();
  String detailUrl;
  PhrasesDao phrasesDao;
  var db;

  PhraseDetailScreen({this.detailUrl}) {
    db = AppDatabase();
    phrasesDao = PhrasesDao(db);
  }

  getPhraseDetail() async {
    var response = await http.get(Uri.parse(detailUrl)).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('content');

      print(element[0]
          .getElementsByTagName('section')[0]
          .getElementsByClassName('meaning')[0]
          .text);
      List<String> meaningList = List<String>();
      List<String> orginMeaningList = List<String>();

      element[0].getElementsByClassName('meanings-body').forEach((element) {
        meaningList.add(element.text);
      });

      return QuoteDetail(
          quote: element[0].getElementsByTagName('h2')[0].text,
          orgin: element[0].getElementsByClassName('origin')[0].text,
          meaningBodyList: meaningList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: AppBarTitle(
          title: 'Origin',
        ),
      ),
      body: FutureBuilder(
          future: getPhraseDetail(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              QuoteDetail phraseDetail = snapshot.data;
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
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.red, Colors.orange]),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            //
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                phraseDetail.quote,
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
                            child: Container(
                              color: Colors.amber.shade100,
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: phraseDetail.meaningBodyList
                                          .map((i) => Container(
                                                alignment: Alignment.centerLeft,
                                                constraints: BoxConstraints(
                                                    minHeight: 100),
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    i,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      fontSize: 30,
                                                      fontFamily: 'Myfont',
                                                    ),
                                                  ),
                                                ),
                                              ))
                                          .toList()),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.red, Colors.orange]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SocialShareRow(
                                content:
                                    phraseDetail.quote + phraseDetail.orgin,
                                type: 'Quote',
                                ontap: () async {
                                  await phrasesDao.insertPhrase(
                                      Phrase(phraseTitile: phraseDetail.quote));
                                  showSnackBar(
                                    context: context,
                                    value: 'Phrase is Saved in your Collection',
                                    icon: Icon(
                                      Icons.system_update,
                                      color: Colors.greenAccent,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              );
            }
            // Don't trigger if one async loading is already under way

            return LodingIndicator();
          }),
    );
  }
}
