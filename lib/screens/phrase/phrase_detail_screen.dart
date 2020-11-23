import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/curd/moor_curd.dart';
import 'package:quoteworld/models/quote_detail.dart';
import 'package:quoteworld/utils/logingindicator,.dart';
import 'package:quoteworld/utils/navigation_style.dart';
import 'package:quoteworld/utils/snak_bar.dart';
import 'package:social_share/social_share.dart';


class PhraseDetailScreen extends StatelessWidget {
   FlutterTts flutterTts = FlutterTts();
  String detailUrl; 
  PhraseDetailScreen({this.detailUrl});

   getPhraseDetail() async {
    var response = await http.get(detailUrl).catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('content');
     
     print(element[0].getElementsByTagName('section')[0].getElementsByClassName('meaning')[0].text);
       List<String> meaningList=List<String> ();
       List<String> orginMeaningList=List<String> ();

  
  element[0].getElementsByClassName('meanings-body').forEach((element) {
     meaningList.add(element.text);
});


      return  QuoteDetail(quote: element[0].getElementsByTagName('h2')[0].text,
      
      
      orgin: element[0].getElementsByClassName('origin')[0].text,
      meaningBodyList: meaningList
      
      
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Origin'),
      ),
      body: FutureBuilder(
                  future: getPhraseDetail(),
                  builder: (context, snapshot) {
                  
                        if(snapshot.hasData)
                        {
                          QuoteDetail phraseDetail=snapshot.data;
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
                                color: Colors.grey.withOpacity(0.4),
                              ),
                              //
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  phraseDetail.quote,
                                  textAlign: TextAlign.justify,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Myfont',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: phraseDetail.meaningBodyList.map((i)=>  Container(
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
                                            i,
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Myfont',
                                            ),
                                          ),
                                        ),
                                      )
                                    ).toList()
                                      
                                     
                                    
                                       
                                  
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          await flutterTts.speak(
                                            phraseDetail.quote
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            Icons.volume_up_outlined,
                                            color: Colors.green,
                                          ),
                                        )),
                                    

                                    InkWell(
                                        onTap: () async {
                                          SocialShare.copyToClipboard(
                                                  '${   phraseDetail.quote}')
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
                                            color: Colors.white.withOpacity(.8),
                                          ),
                                        )),
                                    InkWell(
                                        onTap: () async {
                                          SocialShare.shareSms(   phraseDetail.quote,
                                                  trailingText: '', url: '')
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
                                          SocialShare.shareTwitter(   phraseDetail.quote,
                                                  trailingText: '', url: '')
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
                                                  '${   phraseDetail.quote}')
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
                                                  '${   phraseDetail.quote}')
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
                              ),
                            )
                          ],
                        ),
                      )),
                );
                        }
                              // Don't trigger if one async loading is already under way
                             
                    
                   return LodingIndicator();
        }),
      
       
    );
  }
}