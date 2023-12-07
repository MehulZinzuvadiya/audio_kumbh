import 'package:audio_kumbh/constant/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class LanguageContainer extends StatelessWidget {
  String languageName;

  LanguageContainer({super.key, required this.languageName});

  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = context.watch<HomeProvider>();
    homeProviderF = context.read<HomeProvider>();

    return Container(
      width: 90,
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.grey.shade300,
        border: Border.all(
            color: homeProviderT!.mythemeMode == ThemeMode.dark ? darkColor : lightColor,
            width: 1.5),
      ),
      child: Text(
        languageName,
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w600,
          // color: Color(0xff512A00),
        ),
      ),
    );
  }
}
