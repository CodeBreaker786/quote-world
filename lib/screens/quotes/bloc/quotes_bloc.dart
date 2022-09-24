import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:quoteworld/utils/scrapers.dart';

import '../../../crud/moor_curd.dart';

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
  quotes.addAll(await Scrapers.getQuotes(url));

  emit(QuotesLoadedState(quotes: quotes));
}

_resetQuotes(
    ResetQuotesEvent event, Emitter<QuotesState> emit, List<Item> quotes) {
  quotes.clear();
}
