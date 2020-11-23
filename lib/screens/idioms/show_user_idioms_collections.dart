import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quoteworld/curd/idioms_curd/idioms_curd.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/screens/idioms/idioms_meaning-screean.dart';
import 'package:quoteworld/utils/logingindicator,.dart';
import 'package:quoteworld/utils/navigation_style.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';

class IdiomsUserCollections extends StatefulWidget {
  
IdiomsDao idiomsDao;
  var db;
  IdiomsUserCollections() {
    db = AppDatabase();
    idiomsDao = IdiomsDao(db);
  }

  @override
  _IdiomsUserCollectionsState createState() => _IdiomsUserCollectionsState();
}

class _IdiomsUserCollectionsState extends State<IdiomsUserCollections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.9),
        body: FutureBuilder(
            future:  widget.idiomsDao.getAllIdiom(),
            builder: (context, snapshot) {
              List<Idiom> idiomList = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: idiomList.length,
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
                        widget.idiomsDao.deleteIdiom(idiomList[index]);
                        showSnackBar(
                          context: context,
                          value: 'Idiom is Deleted from Databse Successfully',
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        );
                      },
                      key: ValueKey(idiomList[index]),
                      child: Card(
                          child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                               Navigator.push(
                                context,
                                ScaleRoute(
                                    page: IdiomsMeaningScraper(
                                        url: idiomList[index].idiomMeaningLink)));
                          },
                            
                            child: ListTile(
                              title: Text(
                                idiomList[index].idiom,
                                style: TextStyle(
                                    fontFamily: 'myfont', fontSize: 24),
                              ),
                              subtitle: Text('Click for Idiom origin'),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      await widget.idiomsDao
                                          .deleteIdiom(idiomList[index]);
                                      showSnackBar(
                                        context: context,
                                        value:
                                            'Phrase is Deleted from Databse Successfully',
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      );

                                      setState(() {
                                        idiomList.remove(index);
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
                                              '${idiomList[index].idiom}')
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
                                              idiomList[index].idiom,
                                              trailingText:
                                                 '',
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
                                              idiomList[index].idiom,
                                              trailingText:
                                                '',
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
                                              '${idiomList[index].idiom}  ')
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
                                              '${idiomList[index].idiom} ')
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
              return LodingIndicator();
            }));
  }
}