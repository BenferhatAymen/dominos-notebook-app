import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/models/team_model.dart';

class CustomTeamScore extends StatefulWidget {
  const CustomTeamScore({
    super.key,
    required this.size,
    required this.currentTeam,
    required this.opponentTeam,
    required this.teamColor,
    required this.onAddPoints
  });

  final Size size;
  final Team currentTeam;
  final Team opponentTeam;
  final MaterialColor teamColor;
  final Function(int) onAddPoints;

  @override
  State<CustomTeamScore> createState() => _CustomTeamScoreState();
}

class _CustomTeamScoreState extends State<CustomTeamScore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 154,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: widget.teamColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.currentTeam.name,
                    style: GoogleFonts.inter(
                      color: widget.teamColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.02,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 12,
                  )
                ],
              ),
              Text(
                widget.currentTeam.getPoints().toString(),
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: widget.teamColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(360),
          ),
          child: IconButton(
            icon: Icon(
              Icons.add_circle,
              color: widget.teamColor,
              size: 35,
            ),
            onPressed:(){
               widget.onAddPoints(10);
            },
          ),
        )
      ],
    );
  }
}