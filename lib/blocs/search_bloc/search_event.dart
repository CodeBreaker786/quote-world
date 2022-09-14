part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchScreenFocus extends SearchEvent {}

class SearchScreenUnFocus extends SearchEvent {}
