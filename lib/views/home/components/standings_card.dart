import 'package:flutter/material.dart';
import '../../../resources/constants.dart';
import '../../../models/standing.dart';

class StandingsCard extends StatelessWidget {
  final Standing standing;
  final VoidCallback onTap;

  const StandingsCard({
    super.key,
    required this.standing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: appTextColor.withOpacity(0.2),
              width: 1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    Text(
                      standing.rank.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: appTextColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      standing.team.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: appTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      standing.allGames.played.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: appTextColor,
                      ),
                    ),
                    Text(
                      '${standing.allGames.goals.goalsFor.toString()}:${standing.allGames.goals.against.toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: appTextColor,
                      ),
                    ),
                    Text(
                      standing.goalsDiff.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: appTextColor,
                      ),
                    ),
                    Text(
                      standing.points.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: appTextColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
