import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchHistoryScreen extends StatelessWidget {
  MatchHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: HistoryScreenAppBar(size, context),
      body: Center(
        child: HistoryScoreCard(size: size),
      ),
    );
  }

  PreferredSize HistoryScreenAppBar(Size size, BuildContext context) {
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
                    child: Icon(
                      Icons.delete_rounded,
                      color: Colors.red.withOpacity(0.9),
                      size: 26,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HistoryScoreCard extends StatelessWidget {
  const HistoryScoreCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      height: 50,
      width: size.width * 0.95,
      decoration: BoxDecoration(
        color: Color(0xff888888).withOpacity(0.2),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Container(
                  width: size.width * 0.32,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Aymen",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "150",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: size.width * 0.32,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "15",
                        style: TextStyle(
                            color: Color(0xffFF3B30).withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        "Tayfor",
                        style: TextStyle(
                          color: Color(0xffFF3B30).withOpacity(0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "vs",
              style: TextStyle(
                color: Color(0xffFFFFFF).withOpacity(0.4),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
