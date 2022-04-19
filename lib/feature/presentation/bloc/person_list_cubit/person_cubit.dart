import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/feature/data/datasources/person_data_source.dart';
import 'package:rickandmorty/feature/data/models/person_model.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  int page = 1;

  PersonCubit() : super(PersonEmpty());

  void loadPerson() async {
    if (state is PersonLoading) return;

    final currentState = state;
    var oldPerson = <PersonModel>[];

    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    }

    emit(PersonLoading(oldPerson, isFirstFetch: page == 1));

    final failureOrPerson = await getAllPersons(page);
    page++;
    final persons = (state as PersonLoading).oldPersonList;
    persons.addAll(failureOrPerson);
    emit(PersonLoaded(persons));
  }
}
