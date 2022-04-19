import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/presentation/widgets/person_list_widgets.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.black_600,
        title: const Text('Characters'),
        centerTitle: true,
      ),
      body: PersonsList(),
    );
  }
}
