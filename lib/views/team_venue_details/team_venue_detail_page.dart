import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';

import '../../services/league_service.dart';
import './components/team_venue_detail_body.dart';
import '../../resources/constants.dart';

class TeamVenueDetailPage extends StatelessWidget {
  static const routeName = '/team-detail';

  const TeamVenueDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final teamId = routeArguments['teamId'] ?? "0";
    final teamName = routeArguments['teamName'] ?? 'Team Detail';

    return Scaffold(
      appBar: AppBar(
        title: Text(teamName),
        backgroundColor: appBackgroundColor,
      ),
      backgroundColor: appBackgroundColor,
      body: FutureBuilder(
        future: LeagueService.getTeamVenue(teamId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return TeamDetailBody(
              teamVenue: snapshot.data!,
            );
          } else {
            return const Text('Error happened');
          }
        },
      ),
    );
  }
}
