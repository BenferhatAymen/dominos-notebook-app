import 'package:dominos_notebook/shared/models/game_model.dart';
import 'package:dominos_notebook/shared/models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/home_screen/presentation/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TeamAdapter());
  Hive.registerAdapter(GameAdapter());
  await Hive.openBox("dominos");
    // var mainbox = Hive.box("dominos");
    // mainbox.clear();
  runApp(DominosNoteBookApp());
}

class DominosNoteBookApp extends StatelessWidget {
  const DominosNoteBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
