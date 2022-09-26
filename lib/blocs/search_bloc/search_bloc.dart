import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quoteworld/crud/moor_curd.dart';
import 'package:quoteworld/screens/home/home_screen.dart';
import 'package:quoteworld/utils/constent.dart';
import 'package:quoteworld/utils/scrapers.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchScreenFocus>((event, emit) => _focusSearchSccreen(event, emit));

    on<SearchScreenUnFocus>(
        (event, emit) => _unfocusSearchSccreen(event, emit));
  }
}

_focusSearchSccreen(SearchScreenFocus event, Emitter<SearchState> emit) async {
  if (event.searchText != '') {
    emit(SearchLoadingInProgress());
    List<Item> items =
        await Scrapers.getQuotes(quoteSearchUrl + event.searchText);
    emit(SearchItemLoaded(items, event.searchText));
  } else {
    emit(SearchInitial());
  }
}

_unfocusSearchSccreen(SearchScreenUnFocus event, Emitter<SearchState> emit) {
  emit(SearchUnFous());
}
