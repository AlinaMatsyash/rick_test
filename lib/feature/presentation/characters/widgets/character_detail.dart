import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rickandmorty/feature/data/models/person_model.dart';
import 'package:rickandmorty/feature/presentation/settings/widgets/change_theme_button_widget.dart';
import 'package:rickandmorty/resources/icons.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class CharacterDetailPage extends StatelessWidget {
  final PersonModel person;

  const CharacterDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset(
            MainIcons.stroke,
            color: number ? ColorPalette.white : ColorPalette.black_600,
            fit: BoxFit.scaleDown,
          ),
        ),
        elevation: 0,
        title: Text(
          'Character Details',
          style: Theme.of(context).textTheme.headline6,
        ),
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
                    Text(person.status,
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
