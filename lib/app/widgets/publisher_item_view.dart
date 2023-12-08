import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublisherItem extends StatelessWidget {
  String networkImage;
  String publisherName;

  PublisherItem({required this.networkImage, required this.publisherName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
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
          Container(
            width: 90,
            child: Text(
              publisherName,
              overflow: TextOverflow.visible,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(),
            ),
          ),
        ],
      ),
    );
  }
}
