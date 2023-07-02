part of 'search_place_bloc.dart';

@immutable
abstract class SearchPlaceEvent {
  const SearchPlaceEvent();
}

class SearchPlaceStarted extends SearchPlaceEvent {
  final String place;
  final String? category;

  const SearchPlaceStarted(this.place, this.category);
}
