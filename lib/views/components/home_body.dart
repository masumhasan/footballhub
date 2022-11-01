import 'package:flutter/material.dart';
import 'package:football_app/views/components/standings_header.dart';
import 'package:football_app/views/components/standings_list.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '../../models/league.dart';

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
