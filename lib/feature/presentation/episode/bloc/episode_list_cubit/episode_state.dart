part of 'episode_cubit.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();
  @override
  List<Object?> get props => [];
}

class EpisodeEmpty extends EpisodeState {
  @override
  List<Object?> get props => [];
}

class EpisodeLoading extends EpisodeState {
  final List<EpisodeModel> oldEpisodeList;
  final bool isFirstFetch;

  const EpisodeLoading(this.oldEpisodeList, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldEpisodeList];
}

class EpisodeLoaded extends EpisodeState {
  final List<EpisodeModel> episodesList;

  const EpisodeLoaded(this.episodesList);
  @override
  List<Object?> get props => [episodesList];
}

class EpisodeError extends EpisodeState {
  final String message;

  const EpisodeError({required this.message});
  @override
  List<Object?> get props => [message];
}
