import 'package:flutter/material.dart';

import 'features/home_screen/presentation/home_screen.dart';

void main() {
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
