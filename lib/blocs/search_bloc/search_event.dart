part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchScreenFocus extends SearchEvent {
  final ItemType type;
  final String searchText;
  SearchScreenFocus(this.searchText, this.type);
}

class SearchScreenUnFocus extends SearchEvent {}
