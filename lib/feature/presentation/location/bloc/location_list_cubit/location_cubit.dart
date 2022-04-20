import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/feature/data/datasources/data_source.dart';
import 'package:rickandmorty/feature/data/models/episode_model.dart';
import 'package:rickandmorty/feature/data/models/location_model.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  int page = 1;

  LocationCubit() : super(LocationEmpty());

  void loadLocation() async {
    if (state is LocationLoading) return;

    final currentState = state;
    var oldLocation = <LocationModel>[];

    if (currentState is LocationLoaded) {
      oldLocation = currentState.locationList;
    }

    emit(LocationLoading(oldLocation, isFirstFetch: page == 1));

    final failureOrLocation = await getAllLocations(page);
    page++;
    final locations = (state as LocationLoading).oldLocationList;
    locations.addAll(failureOrLocation);
    emit(LocationLoaded(locations));
  }
}
