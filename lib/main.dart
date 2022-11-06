import 'package:flutter/material.dart';
import './views/home/home_page.dart';
import './views/team_venue_details/team_venue_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Football app",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const HomePage(),
      initialRoute: '/',
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        TeamVenueDetailPage.routeName: (context) => const TeamVenueDetailPage()
      },
    );
  }
}
