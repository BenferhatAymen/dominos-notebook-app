import 'package:dominos_notebook/features/home_screen/logic/hive_functions.dart';
import 'package:dominos_notebook/features/home_screen/presentation/widgets/edit_name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../shared/models/team_model.dart';

class CustomTeamScore extends StatefulWidget {
  CustomTeamScore({
    super.key,
    required this.size,
    required this.currentTeam,
    required this.opponentTeam,
    required this.teamColor,
    required this.onAddPoints,
    required this.currentTeamNameController,
    required this.box,
  });

  final Size size;
  final Team currentTeam;
  final Team opponentTeam;
  final MaterialColor teamColor;
  final Function(int) onAddPoints;
  final TextEditingController currentTeamNameController;

  final Box<dynamic> box;

  @override
  State<CustomTeamScore> createState() => _CustomTeamScoreState();
}

class _CustomTeamScoreState extends State<CustomTeamScore> {
  final GlobalKey<FormState> blueformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> redformKey = GlobalKey<FormState>();
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.teamColor == Colors.blue) {
      formKey = blueformKey;
      print("form1");
    } else {
      formKey = redformKey;
      print('form2');
    }
  }

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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditNameDialog(
                              formKey: GlobalKey<FormState>(),
                              controller: widget.currentTeamNameController,
                              onSave: () {
                              
                                  try {
                                    setState(() {
                                      widget.currentTeam.name =
                                          widget.currentTeamNameController.text;
                                      if (widget.teamColor == Colors.blue) {
                                        writeTeamA(
                                            widget.box, widget.currentTeam);
                                        writeTeamB(
                                            widget.box, widget.opponentTeam);
                                      } else {
                                        writeTeamB(
                                            widget.box, widget.currentTeam);
                                        writeTeamA(
                                            widget.box, widget.opponentTeam);
                                      }
                                    });
                                  } catch (e, stackTrace) {
                                    print('Error: $e');
                                    print('StackTrace: $stackTrace');
                                  }
                               
                              });
                        });
                  },
                  child: Row(
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
            onPressed: () {
              widget.onAddPoints(10);
            },
          ),
        )
      ],
    );
  }
}
