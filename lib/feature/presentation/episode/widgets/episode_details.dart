import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rickandmorty/feature/data/models/episode_model.dart';
import 'package:rickandmorty/feature/presentation/settings/widgets/change_theme_button_widget.dart';
import 'package:rickandmorty/resources/icons.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class EpisodeDetails extends StatelessWidget {
  final EpisodeModel episodes;

  const EpisodeDetails({Key? key, required this.episodes}) : super(key: key);
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
          'Episode Details',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(episodes.name, style: Theme.of(context).textTheme.headline1),
              Text(episodes.episode,
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(color: ColorPalette.bly)),
              ListTile(
                title: Text(
                  'Date',
                  style: Theme.of(context).textTheme.caption,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(episodes.airDate,
                        style: Theme.of(context).textTheme.bodyText2),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
