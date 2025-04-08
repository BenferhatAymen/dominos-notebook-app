import 'package:flutter/material.dart';

import '../../../history_screen/presentation/history_screen.dart';
import 'custom_buttons.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        children: [
          Icon(
            Icons.history,
            color: Colors.blue,
            size: 44,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(child: CustomRestartButton(size: size)),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MatchHistoryScreen()));
            },
          ),
        ],
      ),
    );
  }
}
