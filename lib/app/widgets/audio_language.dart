import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageContainer extends StatelessWidget {
  String languageName;

  LanguageContainer({super.key, required this.languageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.grey.shade300,
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: Text(
        languageName,
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w600,
          color: Color(0xff512A00),
        ),
      ),
    );
  }
}
