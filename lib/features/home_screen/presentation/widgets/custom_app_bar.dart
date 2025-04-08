import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
