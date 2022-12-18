import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:football_app/services/league_service.dart';

import '../../../models/standing.dart';

part 'ranking_event.dart';
part 'ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  final LeagueService _leagueService;

  RankingBloc(this._leagueService) : super(RankingInitialState()) {
    on<LoadRankingEvent>((event, emit) async {
      // TODO: Make league fetching dynamic
      final league = await _leagueService.getMockLeague();
      emit(
        RankingLoadedState(
          league.id,
          league.name,
          league.country,
          league.logo,
          league.flag,
          league.season,
          league.standings,
        ),
      );
    });
  }
}
