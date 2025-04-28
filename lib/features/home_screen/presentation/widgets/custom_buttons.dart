import 'package:dominos_notebook/features/history_screen/presentation/widgets/delete_history_dialog.dart';
import 'package:dominos_notebook/features/home_screen/logic/check_target.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/models/team_model.dart';

class CustomRestartButton extends StatefulWidget {
  CustomRestartButton({super.key, required this.size, this.onSave});

  final Size size;
  void Function()? onSave;

  @override
  State<CustomRestartButton> createState() => _CustomRestartButtonState();
}

class _CustomRestartButtonState extends State<CustomRestartButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return DeleteHistoryDialog(
                onSave: widget.onSave,
              );
            });
      },
      child: Container(
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
              width: widget.size.width * 0.02,
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
              width: widget.size.width * 0.08,
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
      ),
    );
  }
}

class CustomUndoButton extends StatelessWidget {
  CustomUndoButton({
    super.key,
    required this.size,
    this.onTap,
  });

  final Size size;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
