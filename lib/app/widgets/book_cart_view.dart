import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookCartItem extends StatelessWidget {
  String bookImage;
  String audioBookName;
  String bookAuhorName;

  BookCartItem(
      {super.key,
      required this.bookImage,
      required this.audioBookName,
      required this.bookAuhorName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            width: 100,
            child: Image.network(
              bookImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Container(
          width: 20.w,
          child: Text(
            audioBookName,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w700,
              // color: Color(0xff512A00),
              fontSize: 13,
            ),
          ),
        ),
        Container(
          width: 20.w,
          child: Text(
            bookAuhorName,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.quicksand(
              // color: Color(0xff512A00).withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
