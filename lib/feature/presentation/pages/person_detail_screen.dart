import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/data/models/person_model.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonModel person;

  const PersonDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.black_600,
        title: const Text('Character Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      person.image,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                Text(
                  person.name,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text(
                      person.status,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: ListTile(
                        title: Text(
                          'Gender',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        subtitle: Text(person.gender,
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      child: ListTile(
                        title: Text(
                          'Caption',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        subtitle: Text(
                          person.species,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: Text(
                    'Origin',
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Text(
                    person.origin.name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  //trailing: SvgPicture.asset(MainIcons.arrow1),
                ),
                ListTile(
                  title: Text(
                    'Location',
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Text(
                    person.location.name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
