import 'package:flutter/material.dart';
import 'package:football_app/models/league.dart';
import 'ranking_list.dart';

class RankingBody extends StatelessWidget {
  // final League league;

  const RankingBody({
    super.key,
    // required this.league,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RankingList(
              // league: league,
              ),
        ],
      ),
    );
  }
}
