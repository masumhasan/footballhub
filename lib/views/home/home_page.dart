import 'package:flutter/material.dart';
import 'package:football_app/resources/constants.dart';
import 'package:football_app/services/league_service.dart';
import 'package:football_app/views/home/components/home_body.dart';

import '../../models/league.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  League? league;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: appBackgroundColor,
            expandedHeight: 160,
            elevation: 0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              centerTitle: false,
              title: Text(
                league?.name ?? "n/a",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            floating: true,
            pinned: true,
          ),
        ],
        body: FutureBuilder(
          future: LeagueService.getLeague("88"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              league = snapshot.data!;
              return HomeBody(league: snapshot.data!);
            } else {
              return const Text('Error happened');
            }
          },
        ),
      ),
    );
  }
}
