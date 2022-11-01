import 'package:flutter/material.dart';
import 'package:football_app/models/team_venue.dart';
import 'package:football_app/services/league_service.dart';
import 'package:football_app/views/team_venue_details/team_venue_detail.dart';

class TeamDetailState extends StatefulWidget {
  const TeamDetailState({super.key});

  @override
  State<TeamDetailState> createState() => _TeamDetailStateState();
}

class _TeamDetailStateState extends State<TeamDetailState> {
  late TeamVenue teamVenue;

  @override
  void initState() {
    super.initState();
    LeagueService.getTeamVenue('66').then((data) {
      setState(() {
        teamVenue = data;
      });
    }).catchError((e) {
      Navigator.pop(context, "an error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: teamVenue != null
          ? TeamDetail(teamVenue: teamVenue)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
