import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<HomeProvider>(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Text(
            "Theme",
            style: GoogleFonts.quicksand(
              fontSize: 16,
              color: const Color(0xff512A00),
              fontWeight: FontWeight.w600,
            ),
          ),
          Switch(
            value: themeChange.darkTheme,
            onChanged: (bool value) {
              themeChange.darkTheme = value;
            },
          ),
        ],
      ),
    ));
  }
}
