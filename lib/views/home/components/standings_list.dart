import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import './standings_card.dart';
import './standings_header.dart';
import '../../../models/league.dart';

class StandingsList extends StatelessWidget {
  final League league;

  const StandingsList({
    super.key,
    required this.league,
  });

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: StandingsHeader(),
      content: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: league.standings[0].length,
          itemBuilder: (context, index) => StandingsCard(
            standing: league.standings[0][index],
          ),
        ),
      ),
    );
  }
}
