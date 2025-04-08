
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomScoreGoalWidget extends StatelessWidget {
  const CustomScoreGoalWidget({super.key, required this.goalScore});
  final int goalScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9).withOpacity(0.1),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      padding: EdgeInsets.only(
        left: 8,
        right: 15,
        top: 4,
        bottom: 4,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              goalScore.toString(),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ]),
    );
  }
}
