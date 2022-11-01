class GoalStatistics {
  GoalStatistics({
    required this.goalsFor,
    required this.against,
  });

  int goalsFor;
  int against;

  factory GoalStatistics.fromJson(Map<String, dynamic> json) => GoalStatistics(
        goalsFor: json["for"],
        against: json["against"],
      );

  Map<String, dynamic> toJson() => {
        "for": goalsFor,
        "against": against,
      };
}
