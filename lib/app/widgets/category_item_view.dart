import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      width: 35.w,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 1.h,
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
                height: 0.1.h,
                width: 5.w,
                color: Colors.white,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryUseFor,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.sp),
              ),
              SizedBox(
                width: 2.5.w,
              ),
              const FaIcon(FontAwesomeIcons.circleChevronRight, color: Colors.white, size: 15),
            ],
          ),
        ],
      ),
    );
  }
}
