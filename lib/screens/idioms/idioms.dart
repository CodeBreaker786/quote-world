import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/idioms_curd/idioms_curd.dart';
import 'package:quoteworld/curd/lastWord_curd/lastword_curd.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/utils/logingindicator.dart';
import 'package:quoteworld/utils/navigation_style.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:quoteworld/widgets/appbar_tiltle.dart';
import 'package:quoteworld/widgets/social_share.dart';
import 'package:social_share/social_share.dart';

import '../drawer.dart';
import 'idioms_meaning-screean.dart';

class IdiomsScraper extends StatefulWidget {
  IdiomsDao idiomsDao;
  var db;
  IdiomsScraper() {
    db = AppDatabase();
    idiomsDao = IdiomsDao(db);
  }

  @override
  _IdiomsScraperState createState() => _IdiomsScraperState();
}

class _IdiomsScraperState extends State<IdiomsScraper> {
  getIdioms() async {
    final url = 'https://www.phrases.org.uk/idioms/a-z/full-list.html';
    print(url);
    var response = await http.get(Uri.parse(url)).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('list-group-item-text');
      print(element[0].getElementsByTagName('a')[0].attributes['href']);
      List<Idiom> idioms = List<Idiom>();

      element.forEach((element) {
        print(
          element.getElementsByTagName('a')[0].innerHtml,
        );
        idioms.add(Idiom(
          idiom: element.getElementsByTagName('a')[0].innerHtml,
          idiomMeaningLink:
              'https://www.phrases.org.uk/idioms/${element.getElementsByTagName('a')[0].attributes['href'].substring(3)}',
        ));
      });
      return idioms;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: AppBarTitle(
            title: 'Idioms',
          ),
        ),
        body: FutureBuilder(
            future: getIdioms(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Idiom> idioms = snapshot.data;
                return ListView.builder(
                    itemCount: idioms.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                ScaleRoute(
                                    page: IdiomsMeaningScraper(
                                        url: idioms[index].idiomMeaningLink)));
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 7,
                              ),
                              child: Card(
                                color: Colors.amber.shade100,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomRight,
                                          colors: [Colors.red, Colors.orange]),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ListTile(
                                        title: Text(
                                          idioms[index].idiom,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'myfont',
                                              fontSize: 24),
                                        ),
                                        subtitle: Text(
                                          'Click for idiom meaning',
                                          style:
                                              TextStyle(color: Colors.white60),
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SocialShareRow(
                                          showbacground: false,
                                          content: '${idioms[index].idiom}',
                                          type: 'Idiom',
                                          ontap: () async {
                                            await widget.idiomsDao
                                                .insertIdiom(idioms[index]);
                                            showSnackBar(
                                              context: context,
                                              value:
                                                  'Idiom is Saved in your Collection',
                                              icon: Icon(
                                                Icons.system_update,
                                                color: Colors.greenAccent,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ));
              }
              return LodingIndicator();
            }));
  }
}
