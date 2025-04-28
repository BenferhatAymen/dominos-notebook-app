import 'package:dominos_notebook/features/home_screen/logic/check_target.dart';
import 'package:dominos_notebook/features/home_screen/logic/hive_functions.dart';
import 'package:dominos_notebook/features/home_screen/presentation/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../shared/models/team_model.dart';
import 'widgets/add_points_dialog.dart';
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
  late Team blueTeam;

  late Team redTeam;
  String lastAddedTeam = "none";
  int targetScore = 100;

  TextEditingController blueTeamController = TextEditingController();
  TextEditingController redTeamController = TextEditingController();
  TextEditingController redTeamNameController = TextEditingController();
  TextEditingController blueTeamNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void addPoints(Team team, Team opponent, int points) {
    setState(() {
      team.addPoints(points);
      team.addGamePoints(points.toString());
      opponent.addGamePoints("-");
    });
  }

  Team? readTeamA(Box<dynamic> box) {
    return box.get("TeamA");
  }

  Team? readTeamB(Box<dynamic> box) {
    return box.get("TeamB");
  }

  var mainbox = Hive.box("dominos");
  @override
  void initState() {
    super.initState();
    blueTeam = readTeamA(mainbox) ?? Team(name: "Blue Team");
    print(blueTeam.getGamePoints());
    redTeam = readTeamB(mainbox) ?? Team(name: "Red Team");
    Future.delayed(Duration.zero, () {
      precacheDialog(context);
    });
  }

  void precacheDialog(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Offstage(
        offstage: true,
        child: addPointsDialog(
          controller: TextEditingController(),
          onSave: () {},
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
    Future.delayed(const Duration(milliseconds: 50), () {
      overlayEntry.remove();
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
                          goalScore: targetScore,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CustomTeamScore(
                                box: mainbox,
                                size: size,
                                currentTeam: blueTeam,
                                opponentTeam: redTeam,
                                teamColor: Colors.blue,
                                currentTeamNameController:
                                    blueTeamNameController,
                                onAddPoints: (points) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return addPointsDialog(
                                          controller: blueTeamController,
                                          onSave: () {
                                            if (blueTeamController
                                                .text.isNotEmpty) {
                                              setState(() {
                                                blueTeam.addGamePoints(
                                                    blueTeamController.text);
                                                redTeam.addGamePoints("0");

                                                if (checkTarget(blueTeam,
                                                    redTeam, targetScore)) {
                                                  setState(() {
                                                    ResetGame(
                                                        blueTeam, redTeam);
                                                    lastAddedTeam = "none";
                                                  });
                                                }
                                                lastAddedTeam = "blue";
                                                writeTeamA(mainbox, blueTeam);
                                                writeTeamB(mainbox, redTeam);
                                              });
                                            }
                                          },
                                        );
                                      });
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          CustomTeamScore(
                            teamColor: Colors.red,
                            box: mainbox,
                            size: size,
                            currentTeam: redTeam,
                            opponentTeam: blueTeam,
                            currentTeamNameController: redTeamNameController,
                            onAddPoints: (points) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return addPointsDialog(
                                      controller: redTeamController,
                                      onSave: () {
                                        if (redTeamController.text.isNotEmpty) {
                                          setState(() {
                                            redTeam.addGamePoints(
                                                redTeamController.text);
                                            blueTeam.addGamePoints("0");
                                            if (checkTarget(blueTeam, redTeam,
                                                targetScore)) {
                                              setState(() {
                                                ResetGame(blueTeam, redTeam);
                                                lastAddedTeam = "none";
                                              });
                                            }
                                            lastAddedTeam = "red";
                                          });
                                        }
                                      },
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
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
                child: CustomUndoButton(
                  size: size,
                  onTap: () {
                    if (lastAddedTeam != "none") {
                      setState(() {
                        blueTeam.undoPoint();
                        redTeam.undoPoint();
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AppFooter(
                size: size,
                onSave: () {
                  setState(() {
                    ResetGame(blueTeam, redTeam);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
