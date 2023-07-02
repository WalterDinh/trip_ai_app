import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<GetDataRecommendTripStarted>(_onLoadStarted,
        transformer: (events, mapper) => events.switchMap(mapper));
  }
  void _onLoadStarted(
      GetDataRecommendTripStarted event, Emitter<HomeState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
