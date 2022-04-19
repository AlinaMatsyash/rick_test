import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/data/models/person_model.dart';
import 'package:rickandmorty/feature/presentation/pages/person_detail_screen.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class PersonCard extends StatelessWidget {
  final PersonModel person;

  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonDetailPage(person: person),
            ));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90.0),
            child: Image.network(
              person.image,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  person.name,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color: person.status == 'Alive'
                            ? Colors.green
                            : person.status == 'unknown'
                                ? ColorPalette.yellow
                                : person.status == 'Dead'
                                    ? ColorPalette.red
                                    : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        '${person.status} - ${person.species}',
                        style: const TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Last known location:',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  person.location.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Origin',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  person.origin.name,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
