import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quotes_app/crud/moor_curd.dart';
import 'package:quotes_app/models/item_model.dart';
part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  List<Item> quotes = [];
  QuotesBloc({required this.quotes}) : super(QuotesInitial(quotes: quotes)) {
    on<LoadQuotesEvent>((event, emit) => _loadQuotes(event, emit, quotes));
    on<ResetQuotesEvent>((event, emit) => _resetQuotes(event, emit, quotes));
  }
}

_loadQuotes(
    LoadQuotesEvent event, Emitter<QuotesState> emit, List<Item> quotes) async {
  final url = event.quotesURL!;
  emit(QuotesLoadingState(quotes: quotes));
  var response = await http.get(Uri.parse(url)).catchError((error) {});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    dom.Document document = parser.parse(response.body);
    final element = document.getElementsByClassName('quoteDetails');

    quotes.addAll(element.map((e) {
      return Item(
        id: e.hashCode,
        content: e
            .getElementsByClassName('quoteText')[0]
            .firstChild!
            .text!
            .replaceAll('\n\n', ''),
        quoteWriter: e
            .getElementsByClassName('authorOrTitle')[0]
            .text
            .replaceAll('\n    ', ''),
        imageUrl: e.children.length == 2
            ? null
            : e.getElementsByTagName('img')[0].attributes['src'],
      );
    }).toList());

    emit(QuotesLoadedState(quotes: quotes));
  } else {}
}

_resetQuotes(
    ResetQuotesEvent event, Emitter<QuotesState> emit, List<Item> quotes) {
  quotes.clear();
}
