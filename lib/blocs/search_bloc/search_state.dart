part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchItemLoaded extends SearchState {
  final List<Item> items;
  final String keyWord;
  SearchItemLoaded(this.items, this.keyWord);
}

class SearchUnFous extends SearchState {}

class SearchLoadingInProgress extends SearchState {}
