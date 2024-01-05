import 'package:audio_kumbh/constant/theme_constant.dart';
import 'package:audio_kumbh/provider/home_provider.dart';
import 'package:audio_kumbh/view/author_data.dart';
import 'package:audio_kumbh/view/data_screen.dart';
import 'package:audio_kumbh/view/home_screen.dart';
import 'package:audio_kumbh/view/publisher_data.dart';
import 'package:audio_kumbh/view/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'generated/l10n.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static Locale? locale;

  void setLocale(Locale value) {
    setState(() {
      locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: Consumer<HomeProvider>(
        builder: (context, HomeProvider value, child) {
          return ResponsiveSizer(
              maxTabletWidth: 900,
              builder: (p0, p1, p2) {
                return MaterialApp(
                  builder: DevicePreview.appBuilder,
                  debugShowCheckedModeBanner: false,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: value.themeMode,
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    S.delegate,
                  ],
                  locale: locale,
                  routes: {
                    '/': (context) => const SplashScreen(),
                    '/home': (context) => const HomeScreen(),
                    '/data': (context) => const DataScreen(),
                    '/authors': (context) => const AuthorScreen(),
                    '/publisher': (context) => const PublisherScreen(),
                  },
                );
              });
        },
      ),
    );
  }
}
