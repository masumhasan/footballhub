import 'package:flutter/material.dart';
import '../../../models/league.dart';
import 'standings_list.dart';

class HomeBody extends StatelessWidget {
  final League league;

  const HomeBody({
    super.key,
    required this.league,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StandingsList(
            league: league,
          ),
        ],
      ),
    );
  }
}
