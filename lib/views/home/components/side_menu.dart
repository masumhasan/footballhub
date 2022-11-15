import 'package:flutter/material.dart';
import 'package:football_app/views/home/home_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItem(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Image.asset(
                "lib/assets/images/premier-league-logo.png",
                width: 32,
              ),
              title: const Text(
                "Premier League",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(leagueId: 39),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/images/eredivisie-brand-stamp-full.png",
                width: 32,
              ),
              title: const Text(
                "Eredivisie",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(leagueId: 88),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/images/LaLiga_Santander_logo_(stacked).png",
                width: 32,
              ),
              title: const Text(
                "La Liga",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(leagueId: 140),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/images/Ligue1.png",
                width: 32,
              ),
              title: const Text(
                "Ligue 1",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(leagueId: 61),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/images/Serie_A_logo_2022.png",
                width: 32,
              ),
              title: const Text(
                "Serie A",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(leagueId: 135),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "lib/assets/images/Bundesliga_logo_(2017).png",
                width: 32,
              ),
              title: const Text(
                "Bundesliga",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(leagueId: 78),
                ),
              ),
            ),
          ],
        ),
      );
}
