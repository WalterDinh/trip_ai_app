part of 'home_bloc.dart';

enum HomeStateStatus { initial, loading, loadSuccess, loadFailure, reload }

class HomeState {
  final HomeStateStatus status;
  final String type;
  final List<dynamic>? listRecommendTrip;
  final Exception? error;
  final List<dynamic>? listCategory;
  const HomeState._({
    this.listCategory = const [],
    this.status = HomeStateStatus.initial,
    this.type = '',
    this.listRecommendTrip = const [],
    this.error,
  });
  const HomeState.initial() : this._();

  HomeState asLoading() {
    return copyWith(
      status: HomeStateStatus.loading,
    );
  }

  HomeState asLoadSuccess(
      List<dynamic> listRecommendTrip, List<dynamic> categories) {
    return copyWith(
        status: HomeStateStatus.loadSuccess,
        listRecommendTrip: listRecommendTrip,
        listCategory: categories);
  }

  HomeState asLoadFailure(Exception e) {
    return copyWith(
      status: HomeStateStatus.loadFailure,
      error: e,
    );
  }

  HomeState copyWith({
    HomeStateStatus? status,
    String? type,
    List<dynamic>? listRecommendTrip,
    Exception? error,
    List<dynamic>? listCategory,
  }) {
    return HomeState._(
      type: type ?? this.type,
      status: status ?? this.status,
      listRecommendTrip: listRecommendTrip ?? this.listRecommendTrip,
      listCategory: listCategory ?? this.listCategory,
      error: error ?? this.error,
    );
  }
}
