import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/data/models/episode_model.dart';

import 'episode_details.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeModel episodes;

  const EpisodeCard({Key? key, required this.episodes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EpisodeDetails(episodes: episodes),
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
                  episodes.name,
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
