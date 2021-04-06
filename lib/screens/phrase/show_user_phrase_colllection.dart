import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/curd/phrases_curd/phrases_curd.dart';
import 'package:quoteworld/screens/phrase/phrase_detail_screen.dart';
import 'package:quoteworld/utils/logingindicator.dart';
import 'package:quoteworld/utils/navigation_style.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:quoteworld/widgets/social_share.dart';
import 'package:social_share/social_share.dart';

class PhrasesUserCollectionScreen extends StatefulWidget {
  PhrasesDao phrasesDao;
  var db;
  PhrasesUserCollectionScreen() {
    db = AppDatabase();
    phrasesDao = PhrasesDao(db);
  }

  @override
  _PhrasesUserCollectionScreenState createState() =>
      _PhrasesUserCollectionScreenState();
}

class _PhrasesUserCollectionScreenState
    extends State<PhrasesUserCollectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.9),
        body: FutureBuilder(
            future: widget.phrasesDao.getAllPhrases(),
            builder: (context, snapshot) {
              List<Phrase> phrasesList = snapshot.data;
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: phrasesList.length,
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
                        widget.phrasesDao.deletePhrase(phrasesList[index]);
                        showSnackBar(
                          context: context,
                          value: 'Phrase is Deleted from Databse Successfully',
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        );
                      },
                      key: ValueKey(phrasesList[index]),
                      child: Card(
                          color: Colors.amber.shade100,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      SizeRoute(
                                          page: PhraseDetailScreen(
                                              detailUrl: phrasesList[index]
                                                  .phraseLink)));
                                },
                                child: ListTile(
                                  title: Text(
                                    phrasesList[index].phraseTitile,
                                    style: TextStyle(
                                        fontFamily: 'myfont', fontSize: 24),
                                  ),
                                  subtitle: Text('Click for phrase origin'),
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
                                          await widget.phrasesDao
                                              .deletePhrase(phrasesList[index]);
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
                                            phrasesList.remove(index);
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SocialShareRow(
                                        showSaveButton: false,
                                        showbacground: false,
                                        content:
                                            '${phrasesList[index].phraseTitile}',
                                        type: 'Phrase',
                                        ontap: () async {
                                          await widget.phrasesDao
                                              .insertPhrase(phrasesList[index]);
                                          showSnackBar(
                                            context: context,
                                            value:
                                                'Phrase is Saved in your Collection',
                                            icon: Icon(
                                              Icons.system_update,
                                              color: Colors.greenAccent,
                                            ),
                                          );
                                        },
                                      ),
                                    )
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
