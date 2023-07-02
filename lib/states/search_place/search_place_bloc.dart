import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_place_event.dart';
part 'search_place_state.dart';

class SearchPlaceBloc extends Bloc<SearchPlaceEvent, SearchPlaceState> {
  SearchPlaceBloc() : super(const SearchPlaceState.initial()) {
    on<SearchPlaceStarted>(_onLoadStarted,
        transformer: (events, mapper) => events.switchMap(mapper));
  }
  void _onLoadStarted(
      SearchPlaceStarted event, Emitter<SearchPlaceState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadDataSearchFailure(e));
    }
  }
}
