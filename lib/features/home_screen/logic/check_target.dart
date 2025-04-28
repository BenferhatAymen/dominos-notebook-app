import 'package:dominos_notebook/core/constants.dart';
import 'package:dominos_notebook/shared/models/game_model.dart';

import '../../../shared/models/team_model.dart';

void ResetGame(Team teamA, Team teamB) {
  Team copyTeamA = Team(name: teamA.name);
  copyTeamA.addPoints(teamA.getPoints());
  copyTeamA.setGamepints(teamA.getGamePoints());
  Team copyTeamB = Team(name: teamB.name);
  copyTeamB.addPoints(teamB.getPoints());
  copyTeamB.setGamepints(teamB.getGamePoints());

  historyGames.add(Game(teamA: copyTeamA, teamB: copyTeamB));
  teamA.resetPoints();
  teamB.resetPoints();
  teamA.clearPoints();
  teamB.clearPoints();
}

bool checkTarget(Team teamA, Team teamB, int targetScore) {
  return teamA.getPoints() >= targetScore || teamB.getPoints() >= targetScore;
}

void RestartGame(Team teamA, Team teamB) {
  teamA.resetPoints();
  teamB.resetPoints();
  teamA.clearPoints();
  teamB.clearPoints();
}

