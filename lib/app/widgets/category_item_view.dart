import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  String categoryName;
  String categoryUseFor;
  LinearGradient gradient;

  CategoryItem(
      {super.key,
      required this.categoryName,
      required this.categoryUseFor,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 3,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName,
                style: GoogleFonts.quicksand(
                    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
              ),
              Container(
                height: 1,
                width: 20,
                color: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryUseFor,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                width: 15,
              ),
              const FaIcon(FontAwesomeIcons.circleChevronRight, color: Colors.white, size: 15),
            ],
          ),
        ],
      ),
    );
  }
}
