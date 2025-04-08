import 'package:dominos_notebook/features/home_screen/presentation/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/models/team_model.dart';
import 'widgets/app_footer.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_score_goal_widget.dart';
import 'widgets/custom_team_score.dart';
import 'widgets/score_history_section.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Team blueTeam = Team(name: "BLUE TEAM");

  Team redTeam = Team(name: "RED TEAM");
  void addPoints(Team team, Team opponent, int points) {
    setState(() {
      team.addPoints(points);
      team.addGamePoints(points.toString());
      opponent.addGamePoints("-");
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.05,
            right: size.width * 0.03,
            left: size.width * 0.03,
            bottom: size.height * 0.05,
          ),
          child: Column(
            children: [
              CustomAppBar(
                size: size,
                title: "DOMINO",
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        CustomScoreGoalWidget(
                          goalScore: 100,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CustomTeamScore(
                              size: size,
                              currentTeam: blueTeam,
                              opponentTeam: redTeam,
                              teamColor: Colors.blue,
                              onAddPoints: (points) =>
                                  addPoints(blueTeam, redTeam, points),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        CustomTeamScore(
                          teamColor: Colors.red,
                          size: size,
                          currentTeam: redTeam,
                          opponentTeam: blueTeam,
                          onAddPoints: (points) =>
                              addPoints(redTeam, blueTeam, points),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ScoreHistorySection(
                blueScores: blueTeam.getGamePoints(),
                redScores: redTeam.getGamePoints(),
                size: size,
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: CustomUndoButton(size: size),
              ),
              SizedBox(
                height: 20,
              ),
              AppFooter(
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
