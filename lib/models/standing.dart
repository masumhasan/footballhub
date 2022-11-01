import 'game_statistics.dart';
import 'team.dart';

class Standing {
  int rank;
  Team team;
  int points;
  int goalsDiff;
  String group;
  String form;
  String status;
  String? description;
  GameStatistics allGames;
  GameStatistics homeGames;
  GameStatistics awayGames;

  Standing({
    required this.rank,
    required this.team,
    required this.points,
    required this.goalsDiff,
    required this.group,
    required this.form,
    required this.status,
    required this.description,
    required this.allGames,
    required this.homeGames,
    required this.awayGames,
  });

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        rank: json["rank"],
        team: Team.fromJson(json["team"]),
        points: json["points"],
        goalsDiff: json["goalsDiff"],
        group: json["group"],
        form: json["form"],
        status: json["status"],
        description: json["description"],
        allGames: GameStatistics.fromJson(json["all"]),
        homeGames: GameStatistics.fromJson(json["home"]),
        awayGames: GameStatistics.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "team": team.toJson(),
        "points": points,
        "goalsDiff": goalsDiff,
        "group": group,
        "form": form,
        "status": status,
        "description": description,
        "allGames": allGames.toJson(),
        "homeGames": allGames.toJson(),
        "awayGames": allGames.toJson(),
      };
}
