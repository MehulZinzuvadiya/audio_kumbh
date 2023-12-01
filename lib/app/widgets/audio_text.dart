import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? fontColor;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextDirection? textDirection;

  const AppText(
      {super.key,
      required this.title,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.fontColor,
      this.textOverflow,
      this.textDecoration,
      this.maxLines,
      this.textAlign,
      this.letterSpacing,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: textDirection,
      title,
      overflow: textOverflow,
      maxLines: maxLines,
      style: GoogleFonts.quicksand(
        fontSize: fontSize,
        fontStyle: fontStyle,
        decoration: textDecoration,
        fontWeight: fontWeight,
        color: fontColor,
      ),
    );
  }
}
