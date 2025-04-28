import 'package:dominos_notebook/shared/models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'game_model.g.dart';


@HiveType(typeId: 1)
class Game extends HiveObject {
  @HiveField(0)
  final Team teamA;
  @HiveField(1)
  final Team teamB;

  Game({required this.teamA, required this.teamB});
}
