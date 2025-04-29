import 'package:dominos_notebook/core/constants.dart';
import 'package:dominos_notebook/features/history_screen/logic/hive_history.dart';
import 'package:dominos_notebook/features/history_screen/presentation/widgets/delete_history_dialog.dart';
import 'package:dominos_notebook/features/history_screen/presentation/widgets/history_score_card.dart';
import 'package:dominos_notebook/features/home_screen/logic/reset_history.dart';
import 'package:dominos_notebook/shared/models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../shared/models/game_model.dart';

class MatchHistoryScreen extends StatefulWidget {
  MatchHistoryScreen({super.key});

  @override
  State<MatchHistoryScreen> createState() => _MatchHistoryScreenState();
}

class _MatchHistoryScreenState extends State<MatchHistoryScreen> {
  Box<dynamic> mainbox = Hive.box("dominos");
  late List<dynamic> games;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    games = readHistory(mainbox);
    print(games);
  }

  void resetHistoryState() {
    setState(() {
      resetHistory();
      games = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: HistoryScreenAppBar(size, context, resetHistoryState),
      body: Center(
          child: games.length != 0
              ? ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    return HistoryScoreCard(
                      size: size,
                      game: games[index],
                    );
                  })
              : Text(
                  "Play games to fill the history!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                )),
    );
  }

  PreferredSize HistoryScreenAppBar(
      Size size, BuildContext context, void Function()? onSave) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.2),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff4A4A4A).withOpacity(0.2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xffD9D9D9).withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  "Match History",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
                IconButton(
                  icon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xffD9D9D9).withOpacity(0.25),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.delete_rounded,
                        color: Colors.red.withOpacity(0.9), size: 27),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteHistoryDialog(
                            onSave: onSave,
                            // () {
                            //   setState(() {
                            //     resetHistory();
                            //     historyGames = [];
                            //   });
                            // },
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
