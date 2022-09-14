part of 'quotes_bloc.dart';

@immutable
abstract class QuotesEvent {}

class LoadQuotesEvent extends QuotesEvent {
  String? quotesURL;
  LoadQuotesEvent({this.quotesURL});
}

class ResetQuotesEvent extends QuotesEvent {}
