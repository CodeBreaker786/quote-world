import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/curd/quotes_curd/quotes_curd.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';

class QuotesUserCollectionScreen extends StatefulWidget {
  QuotesDao userDao;
  var db;
  QuotesUserCollectionScreen() {
    db = AppDatabase();
    userDao = QuotesDao(db);
  }

  @override
  _QuotesUserCollectionScreenState createState() =>
      _QuotesUserCollectionScreenState();
}

class _QuotesUserCollectionScreenState
    extends State<QuotesUserCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.9),
        body: FutureBuilder(
            future: widget.userDao.getAllQuotes(),
            builder: (context, snapshot) {
              List<Quote> quotesList = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: quotesList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      secondaryBackground: Container(
                        child: Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: Colors.red,
                      ),
                      background: Container(),
                      onDismissed: (dir) {
                        widget.userDao.deleteQuote(quotesList[index]);
                        showSnackBar(
                          context: context,
                          value: 'Quote is Deleted from Databse Successfully',
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        );
                      },
                      key: ValueKey(quotesList[index]),
                      child: Card(
                          color: Colors.amber.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image(
                                    image:
                                        quotesList[index].quoteImageUrl != null
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
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(quotesList[index].quoteWriter),
                                    Text(quotesList[index].quoteTag),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          await widget.userDao
                                              .deleteQuote(quotesList[index]);
                                          showSnackBar(
                                            context: context,
                                            value:
                                                'Quote is Deleted from Databse Successfully',
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          );

                                          setState(() {
                                            quotesList.remove(index);
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        )),
                                    Expanded(child: Container()),
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
                                            color: Colors.white,
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
                          )),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
