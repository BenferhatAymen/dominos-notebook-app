import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../shared/models/team_model.dart';

void writeTeamA(Box<dynamic> box, Team teamA) {
  box.put('TeamA', teamA);
  print(box.get("TeamA"));
}

void writeTeamB(Box<dynamic> box, Team teamB) {
  box.put('TeamB', teamB);
  print(box.get("TeamB"));
}

