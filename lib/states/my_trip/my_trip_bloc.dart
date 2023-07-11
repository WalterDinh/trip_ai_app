import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_trip_event.dart';

part 'my_trip_state.dart';

class MyTripBloc extends Bloc<MyTripEvent, MyTripState> {
  MyTripBloc() : super(const MyTripState.initial()) {
    on<LoadUpcomingTripEvent>(_onLoadUpcomingTrip);
    on<LoadOldTripEvent>(_onLoadOldTrip);
  }

  void _onLoadUpcomingTrip(
      LoadUpcomingTripEvent event, Emitter<MyTripState> emit) {
    final List<dynamic> listUpcomingTrip = [];

    emit(state.copyWith(
      listUpcomingTrip: listUpcomingTrip,
    ));
  }

  void _onLoadOldTrip(LoadOldTripEvent event, Emitter<MyTripState> emit) {
    final List<dynamic> listOldTrip = [];

    emit(state.copyWith(
      listOldTrip: listOldTrip,
    ));
  }
}
