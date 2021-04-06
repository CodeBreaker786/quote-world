import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quoteworld/curd/lastWord_curd/lastword_curd.dart';
import 'package:quoteworld/curd/moor_curd.dart';

import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';

class LastWordsUserCollectionScreen extends StatefulWidget {
  LastWordsDao lastWordsDao;
  var db;
  LastWordsUserCollectionScreen() {
    db = AppDatabase();
    lastWordsDao = LastWordsDao(db);
  }

  @override
  _LastWordsUserCollectionScreenState createState() =>
      _LastWordsUserCollectionScreenState();
}

class _LastWordsUserCollectionScreenState
    extends State<LastWordsUserCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.9),
        body: FutureBuilder(
            future: widget.lastWordsDao.getAllLastWord(),
            builder: (context, snapshot) {
              List<LastWord> quotesList = snapshot.data;
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
                        widget.lastWordsDao.deleteLastWord(quotesList[index]);
                        showSnackBar(
                          context: context,
                          value: 'Words is Deleted from Databse Successfully',
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
                                    image: quotesList[index].imageLink != null
                                        ? NetworkImage(
                                            quotesList[index].imageLink)
                                        : AssetImage('assets/person.jpg'),
                                  ),
                                ),
                                title: Text(
                                  quotesList[index].lastWords,
                                  style: TextStyle(
                                      fontFamily: 'myfont', fontSize: 24),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(quotesList[index].deathAndBirthDates),
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
                                          await widget.lastWordsDao
                                              .deleteLastWord(
                                                  quotesList[index]);
                                          showSnackBar(
                                            context: context,
                                            value:
                                                'Words is Deleted from Databse Successfully',
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
                                                  '${quotesList[index].lastWords} \n ${quotesList[index].name}')
                                              .then((data) {
                                            print(data);
                                          });
                                          showSnackBar(
                                            context: context,
                                            value:
                                                'Words is copied in your clipboard',
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
                                                  quotesList[index].lastWords,
                                                  trailingText:
                                                      quotesList[index].name,
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
                                                  quotesList[index].lastWords,
                                                  trailingText:
                                                      quotesList[index].name,
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
                                                  '${quotesList[index].lastWords} \n ${quotesList[index].name}')
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
                                                  '${quotesList[index].lastWords} \n ${quotesList[index].name}')
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
