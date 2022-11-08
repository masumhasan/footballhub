import 'package:flutter/material.dart';
import 'package:football_app/views/home/components/side_menu.dart';
import '../home/components/home_body.dart';
import '../../resources/constants.dart';
import '../../services/league_service.dart';
import '../../models/league.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  final int leagueId;

  const HomePage({
    super.key,
    required this.leagueId,
  });

  @override
  State<HomePage> createState() => _HomePageState();

  String leagueLogoString() {
    switch (leagueId) {
      case 39:
        return "lib/assets/images/premier-league-logo.png";
      case 88:
        return "lib/assets/images/eredivisie-brand-stamp-full.png";
      case 140:
        return "lib/assets/images/LaLiga_Santander_logo_(stacked).png";
      case 61:
        return "lib/assets/images/Ligue1.png";
      case 135:
        return "lib/assets/images/Serie_A_logo_2022.png";
      default:
        return "lib/assets/images/Bundesliga_logo_(2017).png";
    }
  }
}

class _HomePageState extends State<HomePage> {
  League? league;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      backgroundColor: appBackgroundColor,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: appBackgroundColor,
            expandedHeight: 108,
            elevation: 0,
            iconTheme: const IconThemeData(color: appTextColor),
            flexibleSpace: FlexibleSpaceBar(
              title: Image.asset(
                widget.leagueLogoString(),
                height: 60,
                fit: BoxFit.contain,
              ),
              titlePadding: const EdgeInsets.only(top: 48, bottom: 12),
            ),
            pinned: true,
            onStretchTrigger: () {
              // TODO: Pull to refresh
              print('TODO: Pull to refresh');
              throw Error();
            },
          ),
        ],
        body: FutureBuilder(
          future: LeagueService.getLeague(widget.leagueId.toString()),
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
