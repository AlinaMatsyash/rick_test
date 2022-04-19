import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/feature/presentation/bloc/person_list_cubit/person_cubit.dart';
import 'package:rickandmorty/splash_screeen.dart';
import 'package:rickandmorty/theme/color_theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonCubit>(
      create: (context) => PersonCubit()..loadPerson(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            backgroundColor: ColorPalette.black_600,
            scaffoldBackgroundColor: ColorPalette.black_600),
        home: const SplashScreen(),
      ),
    );
  }
}
