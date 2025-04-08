import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class ScoreHistorySection extends StatefulWidget {
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
  State<ScoreHistorySection> createState() => _ScoreHistorySectionState();
}

class _ScoreHistorySectionState extends State<ScoreHistorySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.36,
      margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
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
            padding: EdgeInsets.only(bottom: widget.size.height * 0.02),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: widget.blueScores.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                widget.blueScores[index],
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
                                widget.redScores[index],
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
