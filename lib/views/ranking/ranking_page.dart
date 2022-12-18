import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/views/ranking/bloc/ranking_bloc.dart';
import '../../services/league_service.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RankingBloc(
        RepositoryProvider.of<LeagueService>(context),
      )..add(LoadRankingEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("My league"),
        ),
        body: BlocBuilder<RankingBloc, RankingState>(
          builder: (context, state) {
            if (state is RankingInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RankingLoadedState) {
              return Column(
                children: [
                  Text(state.name),
                  Text(state.country),
                  Text(state.season.toString()),
                  Text(state.logo),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
