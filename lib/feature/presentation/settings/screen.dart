import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'widgets/settings.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, top: 36),
        child: Settings(),
      ),
    );
  }
}
