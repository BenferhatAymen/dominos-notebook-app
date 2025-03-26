import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                              teamName: "Aymen",
                              teamScore: 100,
                              teamColor: Colors.blue,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        CustomTeamScore(
                          teamColor: Colors.red,
                          size: size,
                          teamName: "Tayfor",
                          teamScore: 89,
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
                blueScores: [
                  "1",
                  "-",
                  "10",
                  "1",
                  "-",
                  "10",
                  "1",
                  "-",
                  "10",
                  "1",
                  "-",
                  "10",
                  "-",
                ],
                redScores: [
                  "-",
                  "25",
                  "-",
                  "-",
                  "25",
                  "-",
                  "-",
                  "25",
                  "-",
                  "-",
                  "25",
                  "-",
                  "25",
                ],
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
          Icon(
            Icons.star_border,
            color: Colors.yellow,
            size: 44,
          ),
        ],
      ),
    );
  }
}

class CustomRestartButton extends StatelessWidget {
  const CustomRestartButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xffFFF4A4A).withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Color(0xffFF4A4A),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: size.width * 0.02,
          ),
          Expanded(
            flex: 1,
            child: Icon(
              Icons.restart_alt_sharp,
              color: Color(0xffFF4A4A),
              size: 28,
            ),
          ),
          SizedBox(
            width: size.width * 0.08,
          ),
          Expanded(
            flex: 5,
            child: Text(
              "RESTART",
              style: GoogleFonts.inter(
                color: Color(0xffFFF4A4A),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomUndoButton extends StatelessWidget {
  const CustomUndoButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.3),
      decoration: BoxDecoration(
        color: Color(0xffFFA500).withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Color(0xffFFA500),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.undo,
            color: Color(0xffFFA500),
            size: 24,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "UNDO",
            style: GoogleFonts.inter(
              color: Color(0xffFFA500),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}

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

class CustomTeamScore extends StatelessWidget {
  const CustomTeamScore({
    super.key,
    required this.size,
    required this.teamName,
    required this.teamScore,
    required this.teamColor,
  });

  final Size size;
  final String teamName;
  final int teamScore;
  final MaterialColor teamColor;
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
              color: teamColor.withOpacity(0.2),
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
                    teamName,
                    style: GoogleFonts.inter(
                      color: teamColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 12,
                  )
                ],
              ),
              Text(
                teamScore.toString(),
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
            color: teamColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(360),
          ),
          child: Icon(
            Icons.add_circle,
            color: teamColor,
            size: 35,
          ),
        )
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.28,
          ),
          Center(
            child: Text(
              title,
              style: GoogleFonts.bonaNova(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
          ),
          Spacer(),
          Center(
            child: Container(
              child: Column(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 26,
                  ),
                  Spacer(),
                  Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 26,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreHistorySection extends StatelessWidget {
  final List<String> blueScores;
  final List<String> redScores;
  final Size size;

  const ScoreHistorySection({
    Key? key,
    required this.blueScores,
    required this.redScores,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.36,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 2,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.02),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics:
                        BouncingScrollPhysics(), // Enables smooth scrolling
                    itemCount: blueScores.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                blueScores[index],
                                style: GoogleFonts.inter(
                                  color: Color(0xff0066FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                redScores[index],
                                style: GoogleFonts.inter(
                                  color: Color(0xffFF4A4A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
