import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../models/team_venue.dart';
import '../models/league.dart';
import '../resources/constants_key.dart';

class LeagueService {
  static const _apiUrl = "api-football-beta.p.rapidapi.com";
  static const _standingsPath = "/standings";
  static const _teamsPath = "/teams";
  static const _headers = {
    "x-rapidapi-key": rapidApiKeyDennis,
    "x-rapidapi-host": "api-football-beta.p.rapidapi.com"
  };

  static Future<League> getLeague(String leagueId) async {
    var dateTimeNow = DateTime.now();
    var params = {
      'season': dateTimeNow.year.toString(),
      'league': leagueId,
    };
    var request = http.Request(
      'GET',
      Uri.https(
        _apiUrl,
        _standingsPath,
        params,
      ),
    );
    request.headers.addAll(_headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseJsonString =
          json.decode(await response.stream.bytesToString());
      var leagueJsonString = responseJsonString['response'][0]['league'];
      var league = League.fromJson(leagueJsonString);
      return league;
    } else {
      print('Error: ${response.stream.bytesToString()}');
      throw e;
    }
  }

  static Future<League> getMockLeague() async {
    final String response =
        await rootBundle.loadString('lib/assets/mockLeague.json');
    var responseJsonString = json.decode(response);
    var leagueJsonString = responseJsonString['response'][0]['league'];
    var league = League.fromJson(leagueJsonString);
    return league;
  }

  static Future<TeamVenue> getTeamVenue(String teamId) async {
    // const url = 'https://api-football-beta.p.rapidapi.com/teams?id=541';
    // const url = 'https://api-football-beta.p.rapidapi.com/teams?id=197';
    final queryParams = {"id": teamId};
    final uri = Uri.https(_apiUrl, _teamsPath, queryParams);

    try {
      final response = await http.get(uri, headers: _headers);
      return TeamVenue.fromJson(jsonDecode(response.body)['response'][0]);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
