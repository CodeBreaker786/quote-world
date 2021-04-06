import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/idioms_curd/idioms_curd.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/models/idioms_detail.dart';
import 'package:quoteworld/utils/logingindicator.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:quoteworld/widgets/appbar_tiltle.dart';
import 'package:quoteworld/widgets/linear_gragient.dart';
import 'package:quoteworld/widgets/social_share.dart';
import 'package:social_share/social_share.dart';

class IdiomsMeaningScraper extends StatefulWidget {
  String url;
  IdiomsDao idiomsDao;
  var db;

  IdiomsMeaningScraper({this.url}) {
    db = AppDatabase();
    idiomsDao = IdiomsDao(db);
  }
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
          backgroundColor: Colors.amber,
          title: AppBarTitle(
            title: 'Idiom Orgin',
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
                                  gradient: myGradient()),
                              //
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  idioms.idiom,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
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
                                                color: Colors.amber),
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
                                                color: Colors.amber),
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
                                                color: Colors.amber),
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
                                                color: Colors.amber),
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
                            ),
                            SocialShareRow(
                              showSaveButton: false,
                              showbacground: true,
                              content: '${idioms.idiom}',
                              type: 'Idiom',
                            ),
                          ],
                        ),
                      )),
                );
              }
              return LodingIndicator();
            }));
  }
}
