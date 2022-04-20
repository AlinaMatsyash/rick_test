import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/feature/data/models/person_model.dart';
import 'package:rickandmorty/feature/presentation/characters/bloc/person_list_cubit/person_cubit.dart';
import 'package:rickandmorty/feature/presentation/characters/widgets/character_card.dart';

class CharacterList extends StatelessWidget {
  final scrollController = ScrollController();

  CharacterList({Key? key}) : super(key: key);
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PersonCubit>(context).loadPerson();
          context.read<PersonCubit>().loadPerson();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<PersonCubit, PersonState>(
      builder: (context, state) {
        List<PersonModel> persons = [];
        bool isLoading = false;
        if (state is PersonLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PersonLoading) {
          persons = state.oldPersonList;
          isLoading = true;
        } else if (state is PersonLoaded) {
          persons = state.personsList;
        } else if (state is PersonError) {
          return Text(
            state.message,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          );
        }
        return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < persons.length) {
                return CharacterCard(person: persons[index]);
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                });
                return _loadingIndicator();
              }
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[700],
              );
            },
            itemCount: persons.length + (isLoading ? 1 : 0));
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
