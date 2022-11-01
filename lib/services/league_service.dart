import 'dart:math';
import 'package:flutter/services.dart';

import '../models/league.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LeagueService {
  static Future<League> getLeague() async {
    var headers = {
      "x-rapidapi-key": "61fad4986bmsh5142dd75777b52cp13c2ccjsn7982019478dc",
      "x-rapidapi-host": "api-football-beta.p.rapidapi.com"
    };
    var params = {
      'season': '2022',
      'league': '88',
    };
    var request = http.Request(
      'GET',
      Uri.https(
        "api-football-beta.p.rapidapi.com",
        "/standings",
        params,
      ),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseJsonString =
          json.decode(await response.stream.bytesToString());
      var leagueJsonString = responseJsonString['response'][0]['league'];
      var league = League.fromJson(leagueJsonString);
      return league;
    } else {
      // TODO: Error handling
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
}
