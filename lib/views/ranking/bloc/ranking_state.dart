part of 'ranking_bloc.dart';

abstract class RankingState extends Equatable {
  const RankingState();

  @override
  List<Object> get props => [];
}

class RankingInitialState extends RankingState {}

class RankingLoadedState extends RankingState {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;
  final List<List<Standing>> standings;

  const RankingLoadedState(this.id, this.name, this.country, this.logo,
      this.flag, this.season, this.standings);

  @override
  List<Object> get props => [id, name, country, logo, flag, season, standings];
}
