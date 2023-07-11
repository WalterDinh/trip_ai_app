part of 'my_trip_bloc.dart';

@immutable
abstract class MyTripEvent {
  const MyTripEvent();
}

class LoadUpcomingTripEvent extends MyTripEvent {
  final List<dynamic>? listUpcomingTrip;

  const LoadUpcomingTripEvent(this.listUpcomingTrip);
}

class LoadOldTripEvent extends MyTripEvent {
  final List<dynamic>? listOldTrip;

  const LoadOldTripEvent(this.listOldTrip);
}
