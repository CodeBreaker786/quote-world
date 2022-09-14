import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchScreenFocus>((event, emit) => _focusSearchSccreen(event, emit));
    on<SearchScreenUnFocus>(
        (event, emit) => _unfocusSearchSccreen(event, emit));
  }
}

_focusSearchSccreen(SearchScreenFocus event, Emitter<SearchState> emit) {
  emit(SearchFous());
}

_unfocusSearchSccreen(SearchScreenUnFocus event, Emitter<SearchState> emit) {
  emit(SearchUnFous());
}
