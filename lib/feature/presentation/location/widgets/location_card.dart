import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/data/models/location_model.dart';

import 'location_details.dart';

class LocationCard extends StatelessWidget {
  final LocationModel location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationDetails(location: location),
            ));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 16, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  location.name,
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
