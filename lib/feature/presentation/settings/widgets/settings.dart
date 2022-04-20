import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rickandmorty/components/divider.dart';
import 'package:rickandmorty/resources/icons.dart';
import 'package:rickandmorty/theme/color_theme.dart';
import 'change_theme_button_widget.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('APPEARANCE',
            style: Theme.of(context)
                .textTheme
                .overline
                ?.copyWith(color: ColorPalette.grey_300)),
        ListTile(
          contentPadding:
              EdgeInsets.only(left: 1, right: 1, top: 15, bottom: 1),
          horizontalTitleGap: 18,
          leading: SvgPicture.asset(MainIcons.palette,
              color: Theme.of(context).shadowColor),
          title: Text(
            'Dark theme',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          subtitle: Text(
            number ? 'Included' : 'switch off',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.apply(color: ColorPalette.grey_300),
          ),
          trailing: ChangeThemeButtonWidget(),
        ),
        const SizedBox(height: 36),
        divider(),
        const SizedBox(height: 36),
        Text(
          'ABOUT APP',
          style: Theme.of(context)
              .textTheme
              .overline
              ?.copyWith(color: ColorPalette.grey_300),
        ),
        const SizedBox(height: 24),
        Text(
          'The Zigerions put Jerry and Rick in a simulation to learn the secret to making concentrated dark matter.',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 36),
        divider(),
        const SizedBox(height: 36),
        Text(
          'APP VERSION',
          style: Theme.of(context)
              .textTheme
              .overline
              ?.copyWith(color: ColorPalette.grey_300),
        ),
        const SizedBox(height: 24),
        Text(
          'Rick & Morty  v1.0.0',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
