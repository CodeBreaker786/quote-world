import 'dart:async';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/utils/admob.dart';
import 'package:quoteworld/utils/logingindicator.dart';
import 'package:quoteworld/utils/no_internet_screen.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:quoteworld/widgets/appbar_tiltle.dart';
import 'package:quoteworld/widgets/social_share.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';
import '../../curd/moor_curd.dart';
import '../../curd/quotes_curd/quotes_curd.dart';

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
  bool _hasMore = true;
  @override
  void initState() {
    super.initState();

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
              bottomNavigationBar: Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StepperSwipe(
                      key: key,
                      initialValue: 1,
                      withBackground: false,
                      iconsColor: Colors.amber,
                      speedTransitionLimitCount: 1,
                      firstIncrementDuration: Duration(milliseconds: 300),
                      secondIncrementDuration: Duration(milliseconds: 300),
                      direction: Axis.horizontal,
                      dragButtonColor: Colors.amber,
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
                backgroundColor: Colors.amber,
                title: AppBarTitle(
                  title: widget.title,
                ),
                actions: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: data.data == ConnectivityResult.none
                          ? Icon(
                              Icons.signal_wifi_off,
                              color: Colors.red,
                            )
                          : Icon(Icons.wifi, color: Colors.green))
                ],
              ),
              body: Container(
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
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.red,
                                                Colors.orange
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          //color: Colors.grey.withOpacity(0.4),
                                        ),
                                        //
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 0, top: 0),
                                              width: 100,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  // color: Colors.grey,
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
                                                      'assets/person.jpg',
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Text(
                                                  quotesList[index].quoteWriter,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                    color: Colors.white,
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
                                        child: Container(
                                          color: Colors.amber.shade100,
                                          child: Scrollbar(
                                            child: SingleChildScrollView(
                                              dragStartBehavior:
                                                  DragStartBehavior.down,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12),
                                                    child: Text(
                                                      quotesList[index]
                                                          .quoteContent,
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          fontFamily: 'Myfont'),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 30, bottom: 20.0),
                                                    child: AdmobBanner(
                                                      adUnitId: AdManager
                                                          .bannerAdUnitId,
                                                      adSize: AdmobBannerSize
                                                          .LARGE_BANNER,
                                                      listener: (AdmobAdEvent
                                                              event,
                                                          Map<String, dynamic>
                                                              args) {},
                                                      onBannerCreated:
                                                          (AdmobBannerController
                                                              controller) {
                                                        // Dispose is called automatically for you when Flutter removes the banner from the widget tree.
                                                        // Normally you don't need to worry about disposing this yourself, it's handled.
                                                        // If you need direct access to dispose, this is your guy!
                                                        // controller.dispose();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SocialShareRow(
                                        content:
                                            '${quotesList[index].quoteContent} \n ${quotesList[index].quoteWriter}',
                                        type: 'Quote',
                                        ontap: () async {
                                          widget.quotesDao
                                              .insertQuote(quotesList[index]);
                                          showSnackBar(
                                            context: context,
                                            value:
                                                'Quote is Saved in your Collection',
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
              child: Center(child: LodingIndicator()))),
    );
  }

  void _loadMore({int page}) {
    pageNo = page != null ? page : pageNo + 1;

    getQuotesData().then((List<Quote> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _hasMore = false;
        });
      } else {
        setState(() {
          quotesList.addAll(fetchedList);
        });
      }
    });
  }
}
