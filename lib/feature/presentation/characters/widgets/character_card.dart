import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/data/models/person_model.dart';
import 'package:rickandmorty/feature/presentation/characters/widgets/character_detail.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class CharacterCard extends StatelessWidget {
  final PersonModel person;

  const CharacterCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CharacterDetailPage(person: person),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        child: Text(person.status,
                            style: person.status == 'Alive'
                                ? Theme.of(context).textTheme.overline
                                : person.status == 'unknown'
                                    ? Theme.of(context)
                                        .textTheme
                                        .overline
                                        ?.copyWith(color: ColorPalette.yellow)
                                    : person.status == 'Dead'
                                        ? Theme.of(context)
                                            .textTheme
                                            .overline
                                            ?.copyWith(color: ColorPalette.red)
                                        : Theme.of(context).textTheme.overline),
                      ),
                    ],
                  ),
                  Text(
                    person.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    '${person.species}, ${person.gender}',
                    style: Theme.of(context).textTheme.caption,
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
      ),
    );
  }
}
