import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/screens/no_internet_screen.dart';
import 'package:quoteworld/utils/logingindicator,.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

import 'curd/moor_curd.dart';
import 'curd/quotes_curd/quotes_curd.dart';

class WebScraperScreen extends StatefulWidget {
  String url, title;
  QuotesDao quotesDao;
  var db;

  WebScraperScreen({this.url, this.title}) {
    db = AppDatabase();
    quotesDao = QuotesDao(db);
  }

  @override
  _WebScraperScreenState createState() => _WebScraperScreenState();
}

class _WebScraperScreenState extends State<WebScraperScreen> {
  List<Quote> quotesList = List<Quote>();
  int pageNo = 0;
  ConnectivityResult connectivityResult;
  bool _isLoading = true;
  bool _hasMore = true;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _hasMore = true;
  }

  Future<List<Quote>> getQuotesData() async {
    final url = widget.url + pageNo.toString();
    print(url);
    var response = await http.get(url).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('quoteDetails');

      List<Quote> quotesList = element.map((e) {
        e.children.length == 2
            ? null
            : print(e.getElementsByTagName('img')[0].attributes['src']);
        return Quote(
            quoteContent:
                e.getElementsByClassName('quoteText')[0].firstChild.text,
            quoteWriter: e.getElementsByClassName('authorOrTitle')[0].innerHtml,
            quoteImageUrl: e.children.length == 2
                ? null
                : e.getElementsByTagName('img')[0].attributes['src'],
            quoteTag: widget.title);
      }).toList();

      return quotesList;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, data) {
          print(data.data);
          connectivityResult = data.data;
          return Scaffold(
              backgroundColor: Colors.white70.withOpacity(0.9),
              floatingActionButton: StepperSwipe(
                withBackground: true,
                initialValue: 1,
                speedTransitionLimitCount: 1,
                firstIncrementDuration: Duration(milliseconds: 300),
                secondIncrementDuration: Duration(milliseconds: 300),
                direction: Axis.vertical,
                dragButtonColor: Colors.grey,
                withSpring: true,
                maxValue: 100,
                stepperValue: pageNo,
                withNaturalNumbers: true,
                withFastCount: true,
                onChanged: (int val) {
                  quotesList.clear();
                  setState(() {});

                  _loadMore(page: val);
                },
              ),
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
              body: data.data != ConnectivityResult.none
                  ? ListView.builder(
                      itemCount: _hasMore && pageNo <= 100
                          ? quotesList.length + 1
                          : quotesList.length,
                      itemBuilder: (context, index) => index >=
                              quotesList.length
                          ? circularbar()
                          :
                          // Don't trigger if one async loading is already under way
                          Card(
                              child: Column(
                              children: [
                                ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: Image(
                                      image: quotesList[index].quoteImageUrl !=
                                              null
                                          ? NetworkImage(
                                              quotesList[index].quoteImageUrl)
                                          : AssetImage('assets/person.jpg'),
                                    ),
                                  ),
                                  title: Text(
                                    quotesList[index].quoteContent,
                                    style: TextStyle(
                                        fontFamily: 'myfont', fontSize: 24),
                                  ),
                                  subtitle: Text(quotesList[index].quoteWriter),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            widget.quotesDao
                                                .insertQuote(quotesList[index]);
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Icon(
                                              Icons.system_update,
                                              color: Colors.green,
                                            ),
                                          )),

                                      InkWell(
                                          onTap: () async {
                                            SocialShare.copyToClipboard(
                                                    '${quotesList[index].quoteContent} \n ${quotesList[index].quoteWriter}')
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
                                            ),
                                          )),
                                      InkWell(
                                          onTap: () async {
                                            SocialShare.shareSms(
                                                    quotesList[index]
                                                        .quoteContent,
                                                    trailingText:
                                                        quotesList[index]
                                                            .quoteWriter,
                                                    url: '')
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
                                            SocialShare.shareTwitter(
                                                    quotesList[index]
                                                        .quoteContent,
                                                    trailingText:
                                                        quotesList[index]
                                                            .quoteWriter,
                                                    url: '')
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
                                                    '${quotesList[index].quoteContent} \n ${quotesList[index].quoteWriter}')
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
                                                    '${quotesList[index].quoteContent} \n ${quotesList[index].quoteWriter}')
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
                                )
                              ],
                            )))
                  : NoInternetScreen());
        });
  }

  Widget circularbar() {
    _loadMore();
    return LodingIndicator();
  }

  void _loadMore({int page}) {
    pageNo = page != null ? page : pageNo + 1;
    _isLoading = true;
    getQuotesData().then((List<Quote> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          quotesList.addAll(fetchedList);
        });
      }
    });
  }
}
