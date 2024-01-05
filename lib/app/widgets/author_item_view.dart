import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthorItem extends StatelessWidget {
  String networkImage;
  String authorName;

  AuthorItem({super.key, required this.networkImage, required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(networkImage),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        SizedBox(
          width: 14.w,
          child: Text(
            authorName,
            overflow: TextOverflow.visible,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
