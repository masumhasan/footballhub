import 'package:flutter/material.dart';
import '../home/components/home_body.dart';
import '../../resources/constants.dart';
import '../../services/league_service.dart';
import '../../models/league.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  League? league;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
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
              title: Image.network(
                league?.logo ?? "",
                height: 60,
                fit: BoxFit.fitHeight,
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
