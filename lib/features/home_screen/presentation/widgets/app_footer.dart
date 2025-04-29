import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../shared/models/team_model.dart';
import '../../../history_screen/presentation/history_screen.dart';
import 'custom_buttons.dart';

class AppFooter extends StatelessWidget {
  AppFooter({super.key, required this.size, this.onSave});

  final Size size;
  void Function()? onSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MatchHistoryScreen()));
            },
            icon: Icon(
              Icons.history,
              color: Colors.blue,
              size: 44,
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
              child: CustomRestartButton(
            size: size,
            onSave: onSave,
          )),
          SizedBox(
            width: size.width * 0.05,
          ),
          IconButton(
            icon: Icon(
              Icons.star_border,
              color: Colors.yellow,
              size: 44,
            ),
            onPressed: () {
              var box = Hive.box("dominos");
              print(box.get("TeamA"));
            },
          ),
        ],
      ),
    );
  }
}
