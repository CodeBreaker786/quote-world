 

import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:http/http.dart'as http;

import 'package:html/dom.dart' as dom;

import 'package:html/parser.dart' as parser ;
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:quoteworld/models/quote_model.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Quote> quotesList=List<Quote>();
int pageNo=1;
bool isLoding=false;

   Future<List<Quote>> getQuotesData()async{
      if(pageNo<=100) {

isLoding=true;
        print(pageNo);
        final url =
            'https://www.goodreads.com/quotes/tag/love?page=$pageNo';
        var response = await http.get(url);
        dom.Document document = parser.parse(response.body);
        final element = document.getElementsByClassName('quoteDetails');
        print(element[2].getElementsByTagName('img')[0].attributes['src']);
        // print( element[0].getElementsByClassName('quoteText')[0].firstChild.text  );
        quotesList += element.map((e) =>
            Quote(
              quoteContent: e.getElementsByClassName('quoteText')[0].firstChild
                  .text,
              quoteWriter: e.getElementsByClassName('authorOrTitle')[0]
                  .innerHtml,
              //quoteImageUrl: e.getElementsByTagName('img')[0].attributes['alt'].toString()
            )).toList();
isLoding=false;
      }
        return quotesList;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Quotes World'),) ,
      body:FutureBuilder<List<Quote>>(
        future: getQuotesData(),
          builder: (context,snapshot){
          if(snapshot.hasData){
              List<Quote> quotes=snapshot.data;
            return LazyLoadScrollView(
isLoading: isLoding,
                scrollOffset: 50,
                onEndOfPage: () => loadMore(),
              child: ListView.builder(
                itemCount: quotes.length,
                  itemBuilder: (context,index){

                return Card(child: ListTile(
//              leading:CircleAvatar(
//                backgroundImage: NetworkImage(quotes[index].quoteImageUrl) ,
//                  ),
                  title: Text(quotes[index].quoteContent),
                 subtitle: Text(quotes[index].quoteWriter),
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

  loadMore() {
     print('callback');
    setState(() {
      pageNo=pageNo+1;
    });
  }
}
