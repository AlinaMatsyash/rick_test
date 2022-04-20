import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/presentation/location/widgets/location_list.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Locations',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: LocationList(),
    );
  }
}
