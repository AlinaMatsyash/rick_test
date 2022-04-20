import 'package:flutter/material.dart';
import 'package:rickandmorty/feature/presentation/characters/widgets/character_list.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Characters',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: CharacterList(),
    );
  }
}
