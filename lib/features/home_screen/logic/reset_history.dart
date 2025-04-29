import 'package:dominos_notebook/core/constants.dart';
import 'package:dominos_notebook/features/home_screen/logic/hive_functions.dart';
import 'package:hive_flutter/hive_flutter.dart';

void resetHistory() {
  historyGames.clear();
  resetHiveHistory();
}
