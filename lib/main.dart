import 'package:flutter/material.dart';
import 'package:music_app/screens/HomeScreen.dart';
import 'package:music_app/screens/SplashScreen.dart';
import 'package:music_app/screens/TrackPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/homeScreen': (context) => HomeScreen(),
        '/trackPage': (context) => TrackPage(),
      },
    );
  }
}
