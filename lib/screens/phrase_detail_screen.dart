import 'package:flutter/material.dart';
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
                          QuoteDetail quoteDetail=snapshot.data;
                          return ListView(
                            children: [
                               Card(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: ListTile(
                                        
                                        title: Text(
                                          quoteDetail.quote,
                                          style: TextStyle(
                                              fontFamily: 'myfont', fontSize: 24),
                                        ),
                                       subtitle: Text(quoteDetail.orgin ),
                                      ),
                                                                ),
                               ),
                         
                             ...quoteDetail.meaningBodyList.map((e){ 
                                
                                
                                return
                                Card(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e+'\n', style: TextStyle(
                                            fontFamily: 'primaryfont', fontSize: 16),),
                                ));
                                })
                              
          
                            ],
                            
                          );
                        }
                              // Don't trigger if one async loading is already under way
                             
                    
                   return LodingIndicator();
        }),
      
       
    );
  }
}