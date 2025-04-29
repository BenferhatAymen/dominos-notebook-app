import 'package:dominos_notebook/core/constants.dart';
import 'package:dominos_notebook/features/home_screen/logic/hive_functions.dart';
import 'package:dominos_notebook/shared/models/game_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../shared/models/team_model.dart';

void ResetGame(Team teamA, Team teamB) {
  Team copyTeamA = Team(name: teamA.name);
  copyTeamA.addPoints(teamA.getPoints());
  copyTeamA.setGamepints(teamA.getGamePoints());
  Team copyTeamB = Team(name: teamB.name);
  copyTeamB.addPoints(teamB.getPoints());
  copyTeamB.setGamepints(teamB.getGamePoints());
  Game gameScore = Game(teamA: copyTeamA, teamB: copyTeamB);
  historyGames.add(gameScore);
  updateHistory(gameScore);
  restartGame(teamA, teamB);
  resetTeamsInLocalStorage(teamA, teamB);
}

bool checkTarget(Team teamA, Team teamB, int targetScore) {
  return teamA.getPoints() >= targetScore || teamB.getPoints() >= targetScore;
}

void restartGame(Team teamA, Team teamB) {
  teamA.resetPoints();
  teamB.resetPoints();
  teamA.clearPoints();
  teamB.clearPoints();
}

void resetTeamsInLocalStorage(Team teamA, Team teamB) {
  Box<dynamic> box = Hive.box("dominos");
  Team copyTeamA = Team(name: teamA.name);
  Team copyTeamB = Team(name: teamB.name);
  writeTeamA(box, copyTeamA);
  writeTeamB(box, copyTeamB);
}

void updateHistory(Game game) {
  Box<dynamic> box = Hive.box("dominos");
  List<dynamic> history = box.get("History") ?? [];

  history.add(game);
  box.put('History', history);
}
