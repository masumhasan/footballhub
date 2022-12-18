part of 'ranking_bloc.dart';

abstract class RankingEvent extends Equatable {
  const RankingEvent();
}

class LoadRankingEvent extends RankingEvent {
  @override
  List<Object> get props => [];
}
