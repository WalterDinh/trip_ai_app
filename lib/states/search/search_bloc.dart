import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.initial()) {
    on<SearchFileAndFolderStarted>(_onSearchFileAndFolder,
        transformer: (events, mapper) => events.switchMap(mapper));

    on<GetRecentSearchStarted>(_onGetRecentSearch,
        transformer: (events, mapper) => events.switchMap(mapper));
  }

  void _onSearchFileAndFolder(
      SearchFileAndFolderStarted event, Emitter<SearchState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadDataSearchFailure(e));
    }
  }

  void _onGetRecentSearch(
      GetRecentSearchStarted event, Emitter<SearchState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadListRecentFailure(e));
    }
  }
}
