part of 'quotes_bloc.dart';

@immutable
abstract class QuotesState {
  final List<Item> quotes;
  QuotesState({required this.quotes});
}

class QuotesInitial extends QuotesState {
  QuotesInitial({required super.quotes});
}

class QuotesLoadedState extends QuotesState {
  final List<Item> quotes;
  QuotesLoadedState({required this.quotes}) : super(quotes: quotes);
}

class QuotesLoadingState extends QuotesState {
  final List<Item> quotes;
  QuotesLoadingState({required this.quotes}) : super(quotes: quotes);
}

class SearchQuotesLoadingState extends QuotesState {
  final List<Item> quotes;
  SearchQuotesLoadingState({required this.quotes}) : super(quotes: quotes);
}

class SearchQuotesLoadedState extends QuotesState {
  final List<Item> quotes;
  SearchQuotesLoadedState({required this.quotes}) : super(quotes: quotes);
}
