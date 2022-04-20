import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/theme/text_theme.dart';

bool number = true;

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      activeColor: Theme.of(context).shadowColor,
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        number = !number;
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
