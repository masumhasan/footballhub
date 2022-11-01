import 'package:flutter/material.dart';
import 'package:football_app/resources/constants.dart';

import '../../../models/standing.dart';

class StandingsCard extends StatelessWidget {
  final Standing standing;
  const StandingsCard({
    super.key,
    required this.standing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      fontSize: 18,
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
                  ),
                  Text(
                    '${standing.allGames.goals.goalsFor.toString()}:${standing.allGames.goals.against.toString()}',
                  ),
                  Text(
                    standing.goalsDiff.toString(),
                  ),
                  Text(
                    standing.points.toString(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
