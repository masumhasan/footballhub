import 'goal_statistics.dart';

class GameStatistics {
  GameStatistics({
    required this.played,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goals,
  });

  int played;
  int win;
  int draw;
  int lose;
  GoalStatistics goals;

  factory GameStatistics.fromJson(Map<String, dynamic> json) => GameStatistics(
        played: json["played"],
        win: json["win"],
        draw: json["draw"],
        lose: json["lose"],
        goals: GoalStatistics.fromJson(json["goals"]),
      );

  Map<String, dynamic> toJson() => {
        "played": played,
        "win": win,
        "draw": draw,
        "lose": lose,
        "goals": goals.toJson(),
      };
}
