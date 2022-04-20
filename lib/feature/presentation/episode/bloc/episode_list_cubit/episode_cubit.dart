import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmorty/feature/data/datasources/data_source.dart';
import 'package:rickandmorty/feature/data/models/episode_model.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  int page = 1;

  EpisodeCubit() : super(EpisodeEmpty());

  void loadEpisode() async {
    if (state is EpisodeLoading) return;

    final currentState = state;
    var oldEpisode = <EpisodeModel>[];

    if (currentState is EpisodeLoaded) {
      oldEpisode = currentState.episodesList;
    }

    emit(EpisodeLoading(oldEpisode, isFirstFetch: page == 1));

    final failureOrEpisode = await getAllEpisodes(page);
    page++;
    final episodes = (state as EpisodeLoading).oldEpisodeList;
    episodes.addAll(failureOrEpisode);
    emit(EpisodeLoaded(episodes));
  }
}
