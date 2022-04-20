import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rickandmorty/feature/data/models/location_model.dart';
import 'package:rickandmorty/feature/presentation/settings/widgets/change_theme_button_widget.dart';
import 'package:rickandmorty/resources/icons.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class LocationDetails extends StatelessWidget {
  final LocationModel location;

  const LocationDetails({Key? key, required this.location}) : super(key: key);
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
            'Location Details',
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(location.name,
                    style: Theme.of(context).textTheme.headline1),
              ),
              Text('${location.type} - ${location.dimension}',
                  style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ));
  }
}
