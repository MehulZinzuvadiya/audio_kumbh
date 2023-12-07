import 'package:audio_kumbh/constant/theme_constant.dart';
import 'package:audio_kumbh/generated/l10n.dart';
import 'package:audio_kumbh/provider/home_provider.dart';
import 'package:audio_kumbh/view/author_data.dart';
import 'package:audio_kumbh/view/data_screen.dart';
import 'package:audio_kumbh/view/home_screen.dart';
import 'package:audio_kumbh/view/publisher_data.dart';
import 'package:audio_kumbh/view/setting_screen.dart';
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
    child: Consumer<HomeProvider>(
      builder: (context, HomeProvider value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          // darkTheme: ThemeData(
          //   appBarTheme: AppBarTheme(backgroundColor: Colors.red),
          //   textTheme: TextTheme(
          //     titleMedium: TextStyle(
          //       color: Colors.white,
          //     ),
          //     bodyMedium: TextStyle(color: Colors.white),
          //   ),
          // ),
          themeMode: value.themeMode,
          routes: {
            '/': (context) => SplashScreen(),
            '/home': (context) => HomeScreen(),
            '/data': (context) => DataScreen(),
            '/authors': (context) => AuthorScreen(),
            '/publisher': (context) => PublisherScreen(),
            // '/settings': (context) => Settings(),
          },
        );
      },
    ),
  ));
}
