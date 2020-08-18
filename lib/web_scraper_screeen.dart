import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:quoteworld/models/quote_model.dart';
import 'package:social_share/social_share.dart';

class webScraperScreen extends StatefulWidget {
  String url, title;
  webScraperScreen({this.url, this.title});

  @override
  _webScraperScreenState createState() => _webScraperScreenState();
}

class _webScraperScreenState extends State<webScraperScreen> {
  List<Quote> quotesList = List<Quote>();
  String img;
  int pageNo = 1;
  bool isLoding = false;

  Future<List<Quote>> getQuotesData() async {
    if (pageNo <= 100) {
      isLoding = true;
      print(pageNo);
      final url = widget.url + pageNo.toString();
      var response = await http.get(url);
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('quoteDetails');
//      print(element[0]
//          .getElementsByTagName('a')[0]
//          .getElementsByTagName('img')[0]
//          .attributes); // print( element[0].getElementsByClassName('quoteText')[0].firstChild.text  );
      quotesList += element.map((e) {
        print(e.getElementsByClassName('quoteText')[0].firstChild.text);
        return Quote(
          quoteContent:
              e.getElementsByClassName('quoteText')[0].firstChild.text,
          quoteWriter: e.getElementsByClassName('authorOrTitle')[0].innerHtml,
//            quoteImageUrl: e.getElementsByTagName('img')[0].has != true
//                ? 'null'
//                : element[0].getElementsByTagName('img')[0].attributes['src']
        );
      }).toList();
      isLoding = false;
    }
    return quotesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Quote>>(
          future: getQuotesData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Quote> quotes = snapshot.data;
              return LazyLoadScrollView(
                isLoading: isLoding,
                scrollOffset: 50,
                onEndOfPage: () => loadMore(),
                child: ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Column(
                        children: [
                          ListTile(
//                            leading: CircleAvatar(
//                              backgroundImage:
//                                  NetworkImage(quotes[index].quoteImageUrl),
//                            ),
                            title: Text(quotes[index].quoteContent),
                            subtitle: Text(quotes[index].quoteWriter),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      SocialShare.shareSms(
                                              "This is Social Share Sms example",
                                              url: "\nhttps://google.com/",
                                              trailingText: "\nhello")
                                          .then((data) {
                                        print(data);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Icon(
                                        Icons.message,
                                      ),
                                    )),
                                InkWell(
                                    onTap: () async {
                                      SocialShare.shareSms(
                                              "This is Social Share Sms example",
                                              url: "\nhttps://google.com/",
                                              trailingText: "\nhello")
                                          .then((data) {
                                        print(data);
                                      });
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.twitter,
                                    )),
                              ],
                            ),
                          )
                        ],
                      ));
                    }),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  buildSocialShareList({String data, Icon icon}) {
    return InkWell(
        onTap: () async {
          SocialShare.shareSms("This is Social Share Sms example",
                  url: "\nhttps://google.com/", trailingText: "\nhello")
              .then((data) {
            print(data);
          });
        },
        child: Icon(
          FontAwesomeIcons.twitter,
        ));
  }

  loadMore() {
    print('callback');
    setState(() {
      pageNo = pageNo + 1;
    });
  }
}
