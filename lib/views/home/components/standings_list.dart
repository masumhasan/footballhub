import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import './standings_header.dart';
import './standings_card.dart';
import '../../../models/league.dart';

class StandingsList extends StatelessWidget {
  final League league;

  const StandingsList({
    super.key,
    required this.league,
  });

  void selectTeam(BuildContext buildContext) {
    Navigator.of(buildContext).pushNamed(
      '/team-detail',
      arguments: {
        'teamId': "197",
        'teamName': 'PSV Eindhoven',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: const StandingsHeader(),
      content: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: league.standings[0].length,
          itemBuilder: (context, index) => StandingsCard(
            standing: league.standings[0][index],
            onTap: (() => selectTeam(context)),
          ),
        ),
      ),
    );
  }
}
