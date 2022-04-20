import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/feature/data/models/episode_model.dart';
import 'package:rickandmorty/feature/presentation/episode/bloc/episode_list_cubit/episode_cubit.dart';

import 'episode_card.dart';

class EpisodeList extends StatelessWidget {
  final scrollController = ScrollController();

  EpisodeList({Key? key}) : super(key: key);
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<EpisodeCubit>(context).loadEpisode();
          context.read<EpisodeCubit>().loadEpisode();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return BlocBuilder<EpisodeCubit, EpisodeState>(
      builder: (context, state) {
        List<EpisodeModel> episodes = [];
        bool isLoading = false;
        if (state is EpisodeLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is EpisodeLoading) {
          episodes = state.oldEpisodeList;
          isLoading = true;
        } else if (state is EpisodeLoaded) {
          episodes = state.episodesList;
        } else if (state is EpisodeError) {
          return Text(
            state.message,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          );
        }
        return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if (index < episodes.length) {
                return EpisodeCard(episodes: episodes[index]);
              } else {
                Timer(const Duration(milliseconds: 30), () {
                  scrollController
                      .jumpTo(scrollController.position.maxScrollExtent);
                });
                return _loadingIndicator();
              }
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[700],
              );
            },
            itemCount: episodes.length + (isLoading ? 1 : 0));
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
