import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/feature/presentation/episode/bloc/episode_list_cubit/episode_cubit.dart';
import 'package:rickandmorty/feature/presentation/location/bloc/location_list_cubit/location_cubit.dart';
import 'package:rickandmorty/splash_screeen.dart';
import 'package:rickandmorty/theme/text_theme.dart';
import 'feature/presentation/characters/bloc/person_list_cubit/person_cubit.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MultiBlocProvider(
            providers: [
              BlocProvider<PersonCubit>(
                create: (context) => PersonCubit()..loadPerson(),
              ),
              BlocProvider<EpisodeCubit>(
                create: (context) => EpisodeCubit()..loadEpisode(),
              ),
              BlocProvider<LocationCubit>(
                create: (context) => LocationCubit()..loadLocation(),
              ),
            ],
            child: MaterialApp(
              themeMode: themeProvider.themeMode,
              theme: ProjectTheme.light(),
              darkTheme: ProjectTheme.dark(),
              debugShowCheckedModeBanner: false,
              // theme: ThemeData.dark().copyWith(
              //     backgroundColor: ColorPalette.black_600,
              //     scaffoldBackgroundColor: ColorPalette.black_600),
              home: const SplashScreen(),
            ),
          );
        },
      );
}
