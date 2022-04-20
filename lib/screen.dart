import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rickandmorty/feature/presentation/characters/characters.dart';
import 'package:rickandmorty/resources/icons.dart';
import 'package:rickandmorty/theme/color_theme.dart';
import 'feature/presentation/episode/episode.dart';
import 'feature/presentation/location/location.dart';
import 'feature/presentation/settings/screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const CharacterScreen(),
    const LocationScreen(),
    const EpisodeScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorPalette.grey_300,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.subtract,
              color: _selectedIndex == 0
                  ? ColorPalette.green
                  : ColorPalette.grey_300,
            ),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.location,
              color: _selectedIndex == 1
                  ? ColorPalette.green
                  : ColorPalette.grey_300,
            ),
            label: 'Locations',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.episode,
              color: _selectedIndex == 2
                  ? ColorPalette.green
                  : ColorPalette.grey_300,
            ),
            label: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              MainIcons.settings,
              color: _selectedIndex == 3
                  ? ColorPalette.green
                  : ColorPalette.grey_300,
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorPalette.green,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
