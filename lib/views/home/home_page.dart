import 'package:flutter/material.dart';

import '../home/components/home_body.dart';
import '../../resources/constants.dart';
import '../../services/league_service.dart';
import '../../models/league.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  League? league;
  late Future _getLeagueFuture;

  Future _obtainGetLeagueFuture() {
    return LeagueService.getLeague("88");
  }

  @override
  void initState() {
    _getLeagueFuture = _obtainGetLeagueFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: appBackgroundColor,
            expandedHeight: 100,
            elevation: 0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              centerTitle: false,
              title: Text(
                league?.name ?? "Standings",
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
          future: _getLeagueFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Oops, an error occured!'),
              );
            } else {
              league = snapshot.data!;
              return HomeBody(league: snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
