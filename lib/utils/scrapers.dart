import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../crud/moor_curd.dart';

class Scrapers {
  static Future<List<Item>> getQuotes(String url) async {
    var response = await http.get(Uri.parse(url)).catchError((error) {});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      dom.Document document = parser.parse(response.body);
      final element = document.getElementsByClassName('quoteDetails');

      return element.map((e) {
        return Item(
          id: e.hashCode,
          content:
              e.getElementsByClassName('quoteText')[0].firstChild!.text!.trim(),
          quoteWriter: e.getElementsByClassName('authorOrTitle')[0].text.trim(),
          isLiked: false,
          imageUrl: e.children.length == 2
              ? null
              : e.getElementsByTagName('img')[0].attributes['src'],
        );
      }).toList();
    } else {
      return [];
    }
  }
}
