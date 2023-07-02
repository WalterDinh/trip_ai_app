part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class GetDataRecommendTripStarted extends HomeEvent {
  final String type;

  const GetDataRecommendTripStarted(this.type);
}
