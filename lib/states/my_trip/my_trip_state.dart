part of 'my_trip_bloc.dart';

class MyTripState {
  final List<dynamic>? listUpcomingTrip;
  final List<dynamic>? listOldTrip;

  const MyTripState._({this.listUpcomingTrip, this.listOldTrip});

  const MyTripState.initial() : this._();

  MyTripState copyWith(
      {final List<dynamic>? listUpcomingTrip,
      final List<dynamic>? listOldTrip}) {
    return MyTripState._(
      listUpcomingTrip: listUpcomingTrip,
      listOldTrip: listOldTrip
    );
  }
}
