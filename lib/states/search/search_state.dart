part of 'search_bloc.dart';

enum SearchStateStatus {
  initial,
  loading,
  loadDataSearchSuccess,
  loadDataSearchFailure,
  getListRecentSuccess,
  getListRecentFailure
}

class SearchState {
  final List<dynamic> listRecent;
  final List<dynamic> listTripDataSearch;

  final SearchStateStatus status;
  final Exception? error;
  const SearchState._({
    this.status = SearchStateStatus.initial,
    this.listRecent = const [],
    this.listTripDataSearch = const [],
    this.error,
  });
  const SearchState.initial() : this._();

  SearchState asLoading() {
    return copyWith(
      status: SearchStateStatus.loading,
    );
  }

  SearchState asLoadListRecentFailure(Exception e) {
    return copyWith(
      status: SearchStateStatus.getListRecentFailure,
      error: e,
    );
  }

  SearchState asLoadDataSearchFailure(Exception e) {
    return copyWith(
      status: SearchStateStatus.loadDataSearchFailure,
      error: e,
    );
  }

  SearchState copyWith({
    final List<dynamic>? listRecent,
    final List<dynamic>? listTripDataSearch,
    final SearchStateStatus? status,
    final Exception? error,
  }) {
    return SearchState._(
        status: status ?? this.status,
        listRecent: listRecent ?? this.listRecent,
        listTripDataSearch: listTripDataSearch ?? this.listTripDataSearch,
        error: error ?? this.error);
  }
}
