import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
