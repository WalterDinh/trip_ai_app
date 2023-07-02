part of 'search_place_bloc.dart';

enum SearchPlaceStateStatus {
  initial,
  loading,
  loadDataSearchSuccess,
  loadDataSearchFailure,
  getListRecentSuccess,
  getListRecentFailure
}

class SearchPlaceState {
  final List<dynamic> listRecent;
  final List<dynamic> listDataSearch;

  final SearchPlaceStateStatus status;
  final Exception? error;
  const SearchPlaceState._({
    this.status = SearchPlaceStateStatus.initial,
    this.listRecent = const [],
    this.listDataSearch = const [],
    this.error,
  });
  const SearchPlaceState.initial() : this._();

  SearchPlaceState asLoading() {
    return copyWith(
      status: SearchPlaceStateStatus.loading,
    );
  }

  SearchPlaceState asLoadListRecentFailure(Exception e) {
    return copyWith(
      status: SearchPlaceStateStatus.getListRecentFailure,
      error: e,
    );
  }

  SearchPlaceState asLoadDataSearchFailure(Exception e) {
    return copyWith(
      status: SearchPlaceStateStatus.loadDataSearchFailure,
      error: e,
    );
  }

  SearchPlaceState copyWith({
    final List<dynamic>? listRecent,
    final List<dynamic>? listDataSearch,
    final SearchPlaceStateStatus? status,
    final Exception? error,
  }) {
    return SearchPlaceState._(
        status: status ?? this.status,
        listRecent: listRecent ?? this.listRecent,
        listDataSearch: listDataSearch ?? this.listDataSearch,
        error: error ?? this.error);
  }
}
