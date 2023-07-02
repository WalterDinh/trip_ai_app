part of 'create_trip_bloc.dart';

enum CreateTripStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  reload
}

class CreateTripState {
  final CreateTripStateStatus status;
  final String type;
  final List<dynamic>? dataPlan;
  final dynamic dataPlace;
  final Exception? error;
  const CreateTripState._({
    this.status = CreateTripStateStatus.initial,
    this.type = '',
    this.dataPlace,
    this.dataPlan = const [],
    this.error,
  });
  const CreateTripState.initial() : this._();

  CreateTripState asLoading() {
    return copyWith(
      status: CreateTripStateStatus.loading,
    );
  }

  CreateTripState asLoadSuccess(List<dynamic> dataPlan) {
    return copyWith(
      status: CreateTripStateStatus.loadSuccess,
      dataPlan: dataPlan,
    );
  }

  CreateTripState asLoadFailure(Exception e) {
    return copyWith(
      status: CreateTripStateStatus.loadFailure,
      error: e,
    );
  }

  CreateTripState copyWith({
    CreateTripStateStatus? status,
    String? type,
    List<dynamic>? dataPlan,
    Exception? error,
    dynamic dataPlace,
    List<dynamic>? listCategory,
  }) {
    return CreateTripState._(
      dataPlace: dataPlace ?? this.dataPlace,
      type: type ?? this.type,
      status: status ?? this.status,
      dataPlan: dataPlan ?? this.dataPlan,
      error: error ?? this.error,
    );
  }
}
