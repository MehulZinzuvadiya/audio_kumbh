import 'package:audio_kumbh/provider/home_provider.dart';
import 'package:audio_kumbh/view/author_data.dart';
import 'package:audio_kumbh/view/data_screen.dart';
import 'package:audio_kumbh/view/home_screen.dart';
import 'package:audio_kumbh/view/publisher_data.dart';
import 'package:audio_kumbh/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/data': (context) => DataScreen(),
        '/authors': (context) => AuthorScreen(),
        '/publisher': (context) => PublisherScreen(),
      },
    ),
  ));
}