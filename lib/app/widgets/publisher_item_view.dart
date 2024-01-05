import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PublisherItem extends StatelessWidget {
  String networkImage;
  String publisherName;

  PublisherItem({required this.networkImage, required this.publisherName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                networkImage,
              )),
           SizedBox(
            height:0.5.h,
          ),
          Container(
            width: 15.w,
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
