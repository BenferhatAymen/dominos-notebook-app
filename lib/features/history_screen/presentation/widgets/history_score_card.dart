import 'package:flutter/material.dart';

import '../../../../shared/models/game_model.dart';
import '../../../../shared/models/team_model.dart';

class HistoryScoreCard extends StatelessWidget {
  const HistoryScoreCard({
    super.key,
    required this.size,
    required this.game,
  });

  final Size size;
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.only(left: 24, right: 24),
      height: 50,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        color: Color(0xff888888).withOpacity(0.2),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Container(
                  width: size.width * 0.32,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        game.teamA.name,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        game.teamA.getPoints().toString(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: size.width * 0.32,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        game.teamB.getPoints().toString(),
                        style: TextStyle(
                            color: Color(0xffFF3B30).withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        game.teamB.name,
                        style: TextStyle(
                          color: Color(0xffFF3B30).withOpacity(0.5),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "vs",
              style: TextStyle(
                color: Color(0xffFFFFFF).withOpacity(0.4),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
