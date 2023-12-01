import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCartItem extends StatelessWidget {
  String bookImage;
  String audioBookName;
  String bookAuhorName;

  BookCartItem(
      {required this.bookImage,
      required this.audioBookName,
      required this.bookAuhorName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
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
            height: 5,
          ),
          Container(
            width: 90,
            child: Text(
              audioBookName,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 90,
            child: Text(
              bookAuhorName,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.quicksand(),
            ),
          ),
        ],
      ),
    );
  }
}
