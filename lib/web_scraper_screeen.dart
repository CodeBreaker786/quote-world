import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/screens/no_internet_screen.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:social_share/social_share.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

import 'curd/moor_curd.dart';
import 'curd/quotes_curd/quotes_curd.dart';

class WebScraperScreen extends StatefulWidget {
  String url, title;
  QuotesDao quotesDao;
  var db;
  StreamController<int> controller = StreamController<int>();
  WebScraperScreen({this.url, this.title}) {
    db = AppDatabase();
    quotesDao = QuotesDao(db);
  }

  @override
  _WebScraperScreenState createState() => _WebScraperScreenState();
}

class _WebScraperScreenState extends State<WebScraperScreen> {
  FlutterTts flutterTts = FlutterTts();
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List<Quote> quotesList = List<Quote>();

  int pageNo = 0;
  Key key;
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
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, data) {
          print(data.data);
          connectivityResult = data.data;
          return Scaffold(
              backgroundColor: Colors.white70,
              bottomNavigationBar: Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StepperSwipe(
                      key: key,
                      initialValue: 1,
                      iconsColor: Colors.grey.withOpacity(.8),
                      speedTransitionLimitCount: 1,
                      firstIncrementDuration: Duration(milliseconds: 300),
                      secondIncrementDuration: Duration(milliseconds: 300),
                      direction: Axis.horizontal,
                      dragButtonColor: Colors.grey.withOpacity(.8),
                      withSpring: true,
                      maxValue: 100,
                      withNaturalNumbers: true,
                      withFastCount: true,
                      stepperValue: pageNo,
                      onChanged: (int val) {
                        quotesList.clear();
                        setState(() {});

                        _loadMore(page: val - 1);
                      },
                    ),
                  ],
                ),
              ),
              // floatingActionButton: RadialMenu(),
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
              body: Container(
                width: 400,
                child: data.data != ConnectivityResult.none
                    ? ScrollablePositionedList.builder(
                        itemScrollController: itemScrollController,
                        itemPositionsListener: itemPositionsListener,
                        scrollDirection: Axis.horizontal,
                        itemCount: _hasMore && pageNo <= 100
                            ? quotesList.length + 1
                            : quotesList.length,
                        itemBuilder: (context, index) {
                          if (index >= quotesList.length) {
                            return circularbar();
                          }

                          // Don't trigger if one async loading is already under way
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
                                              margin:
                                                  EdgeInsets.only(bottom: 1),
                                              width: 100,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15))),
                                              child: quotesList[index]
                                                          .quoteImageUrl !=
                                                      null
                                                  ? Image.network(
                                                      quotesList[index]
                                                          .quoteImageUrl,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : Image.asset(
                                                      'assets/person.jpg'),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Text(
                                                  quotesList[index].quoteWriter,
                                                  textAlign: TextAlign.justify,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text(
                                                quotesList[index].quoteContent,
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
                                                      quotesList[index]
                                                          .quoteContent,
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
                                                    widget.quotesDao
                                                        .insertQuote(
                                                            quotesList[index]);
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
                                                            quotesList[index]
                                                                .quoteContent,
                                                            trailingText:
                                                                quotesList[
                                                                        index]
                                                                    .quoteWriter,
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
                                                            quotesList[index]
                                                                .quoteContent,
                                                            trailingText:
                                                                quotesList[
                                                                        index]
                                                                    .quoteWriter,
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
                                                            '${quotesList[index].quoteContent} \n ${quotesList[index].quoteWriter}')
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
                                                            '${quotesList[index].quoteContent} \n ${quotesList[index].quoteWriter}')
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
                        })
                    : NoInternetScreen(),
              ));
        });
  }

  Widget circularbar() {
    _loadMore();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                ),
              ))),
    );
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
