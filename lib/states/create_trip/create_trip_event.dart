part of 'create_trip_bloc.dart';

@immutable
abstract class CreateTripEvent {
  const CreateTripEvent();
}

class CreatePlanTripStarted extends CreateTripEvent {
  final String tripName;
  final Object location;
  final String startDate;
  final String endDate;
  final List<double> budgetRange;
  final int adultNumber;
  final int childNumber;
  final int genderNumber;

  const CreatePlanTripStarted(
      this.tripName,
      this.location,
      this.startDate,
      this.endDate,
      this.budgetRange,
      this.adultNumber,
      this.childNumber,
      this.genderNumber);
}

class CreateTripStarted extends CreateTripEvent {
  final List<dynamic> dataPlan;
  final String tripName;
  final dynamic location;
  final String startDate;
  final String endDate;
  final double budget;

  const CreateTripStarted(this.dataPlan, this.tripName, this.location,
      this.startDate, this.endDate, this.budget);
}

class RerollTripStarted extends CreateTripEvent {
  final List<dynamic> dataPlan;
  final String tripName;
  final dynamic location;
  final String startDate;
  final String endDate;
  final double budget;

  const RerollTripStarted(this.dataPlan, this.tripName, this.location,
      this.startDate, this.endDate, this.budget);
}

class UpdatePlanTrip extends CreateTripEvent {
  final List<dynamic> dataPlan;

  const UpdatePlanTrip(this.dataPlan);
}
