import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';

import '../../services/league_service.dart';
import './components/team_venue_detail_body.dart';
import '../../resources/constants.dart';

class TeamVenueDetailPage extends StatelessWidget {
  static const routeName = "/team-detail";
  static const dummyTeamVenue = TeamVenue(
    teamId: 0,
    teamName: "Dummy Team",
    teamCountry: "Dummy Country",
    teamFounded: 2048,
    teamLogo:
        "https://images.unsplash.com/photo-1599446740719-23f3414840ba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb3RiYWxsJTIwbG9nb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60",
    venueId: 0,
    venueName: "Dummy Venue",
    venueAddress: "Dummy Venue Address",
    venueCity: "Dummy Venue City",
    venueCapacity: 0,
    venueSurface: "Dummy Venue Surface",
    venueImage:
        "https://images.unsplash.com/photo-1487466365202-1afdb86c764e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c29jY2VyJTIwc3RhZGl1bXxlbnwwfDB8MHx8&auto=format&fit=crop&w=900&q=60",
  );

  const TeamVenueDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final teamId = routeArguments['teamId'] ?? '0';
    final teamName = routeArguments['teamName'] ?? 'Team Detail';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          teamName,
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
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
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: const Text('Oops, en error ocurred!'),
              content: const Text(
                  'Something went wrong during loading of the standigs...'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                )
              ],
            );
          } else {
            return TeamDetailBody(
              teamVenue: snapshot.data!,
            );
          }
        },
      ),
    );
  }
}
