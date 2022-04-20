import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rickandmorty/resources/images.dart';
import 'package:rickandmorty/screen.dart';
import 'package:rickandmorty/theme/color_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.black_800,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          constraints: BoxConstraints.expand(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Images.image1),
            ),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Image.asset(
                Images.inscription,
                height: MediaQuery.of(context).size.height / 2,
              ),
              Image.asset(Images.morty,
                  height: MediaQuery.of(context).size.height / 4),
              Image.asset(Images.rick,
                  height: MediaQuery.of(context).size.height / 4),
            ],
          ),
        ),
      ),
    );
  }
}
