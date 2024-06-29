import 'package:flutter/material.dart';
import 'package:tiktok_app/beranda.dart';
import 'package:tiktok_app/theme/theme.dart' as style;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Nunito',
            ),
        primaryTextTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Nunito',
            ),
        scaffoldBackgroundColor: style.Colors.scaffoldDarkBack,
        primaryColorBrightness: Brightness.dark,
        splashColor: Colors.black.withOpacity(0.0),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: style.Colors.mainColor,
            selectedIconTheme: IconThemeData(color: style.Colors.mainColor),
            unselectedIconTheme: const IconThemeData(color: Colors.white)),
        primaryColor: Colors.black,
        dividerColor: Colors.white54,
        iconTheme: const IconThemeData(color: Colors.white),
        primaryIconTheme: const IconThemeData(color: Colors.black87),
      ),
      home: const Beranda(),
    );
  }
}
