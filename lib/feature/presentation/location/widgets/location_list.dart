import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/feature/data/models/location_model.dart';
import 'package:rickandmorty/feature/presentation/location/bloc/location_list_cubit/location_cubit.dart';

import 'location_card.dart';

class LocationList extends StatelessWidget {
  final scrollController = ScrollController();

  LocationList({Key? key}) : super(key: key);
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<LocationCubit>(context).loadLocation();
          context.read<LocationCubit>().loadLocation();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        List<LocationModel> locations = [];
        bool isLoading = false;
        if (state is LocationLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is LocationLoading) {
          locations = state.oldLocationList;
          isLoading = true;
        } else if (state is LocationLoaded) {
          locations = state.locationList;
        } else if (state is LocationError) {
          return Text(
            state.message,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          );
        }
        return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < locations.length) {
                return LocationCard(location: locations[index]);
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
            itemCount: locations.length + (isLoading ? 1 : 0));
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
