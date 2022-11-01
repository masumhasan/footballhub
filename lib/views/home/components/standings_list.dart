import 'package:flutter/material.dart';
import 'package:football_app/views/home/components/standings_card.dart';
import 'package:football_app/views/team_venue_details/team_venue_detail_state.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../../models/league.dart';
import 'standings_header.dart';

class StandingsList extends StatelessWidget {
  final League league;

  const StandingsList({
    super.key,
    required this.league,
  });

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
            opTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamDetailState(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
