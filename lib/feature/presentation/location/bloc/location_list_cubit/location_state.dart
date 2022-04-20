part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object?> get props => [];
}

class LocationEmpty extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationLoading extends LocationState {
  final List<LocationModel> oldLocationList;
  final bool isFirstFetch;

  const LocationLoading(this.oldLocationList, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldLocationList];
}

class LocationLoaded extends LocationState {
  final List<LocationModel> locationList;

  const LocationLoaded(this.locationList);
  @override
  List<Object?> get props => [locationList];
}

class LocationError extends LocationState {
  final String message;

  const LocationError({required this.message});
  @override
  List<Object?> get props => [message];
}
