import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorItem extends StatelessWidget {
  String networkImage;
  String authorName;

  AuthorItem({super.key, required this.networkImage, required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: 70,
            child: Image.network(
              networkImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 70,
          child: Text(
            authorName,
            overflow: TextOverflow.visible,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              // color: Color(0xff512A00),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
