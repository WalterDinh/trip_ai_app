import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'create_trip_event.dart';
part 'create_trip_state.dart';

class CreateTripBloc extends Bloc<CreateTripEvent, CreateTripState> {
  CreateTripBloc() : super(const CreateTripState.initial()) {
    on<CreatePlanTripStarted>(_onCreatePlanTrip,
        transformer: (events, mapper) => events.switchMap(mapper));
    on<CreateTripStarted>(_onCreateTrip,
        transformer: (events, mapper) => events.switchMap(mapper));
    on<RerollTripStarted>(_onRerollTrip,
        transformer: (events, mapper) => events.switchMap(mapper));
    on<UpdatePlanTrip>(_onUpdatePlanTrip,
        transformer: (events, mapper) => events.switchMap(mapper));
  }

  void _onCreatePlanTrip(
      CreatePlanTripStarted event, Emitter<CreateTripState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onCreateTrip(
      CreateTripStarted event, Emitter<CreateTripState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onRerollTrip(
      RerollTripStarted event, Emitter<CreateTripState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onUpdatePlanTrip(
      UpdatePlanTrip event, Emitter<CreateTripState> emit) async {
    try {
      emit(state.asLoading());
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
