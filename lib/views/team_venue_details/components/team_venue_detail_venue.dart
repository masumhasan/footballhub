import 'package:flutter/material.dart';

import '../../../models/team_venue.dart';

class TeamVenueDetailVenue extends StatelessWidget {
  final TeamVenue teamVenue;

  const TeamVenueDetailVenue({super.key, required this.teamVenue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 15.0, right: 15.0, bottom: 0.0),
          child: Text(
            'Venue',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 2.5, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Stadium'),
                trailing: Text(teamVenue.venueName),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 1.25, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Address'),
                trailing: Text(teamVenue.venueAddress),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 1.25, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.location_city),
                title: const Text('City'),
                trailing: Text(teamVenue.venueCity),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 1.25, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.reduce_capacity),
                title: const Text('Capacity'),
                trailing: Text(teamVenue.venueCapacity.toString()),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, top: 1.25, right: 15.0, bottom: 0.0),
          child: Card(
            child: SizedBox(
              width: double.infinity,
              // height: 50,
              child: ListTile(
                leading: const Icon(Icons.grass),
                title: const Text('Surface'),
                trailing: Text(teamVenue.venueSurface),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
