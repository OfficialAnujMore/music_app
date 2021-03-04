import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          margin: EdgeInsets.only(
            bottom: 20.0,
          ),
          decoration: BoxDecoration(
            image: new DecorationImage(
                image: NetworkImage(
                    "https://media.wired.com/photos/5f9ca518227dbb78ec30dacf/master/w_2560%2Cc_limit/Gear-RIP-Google-Music-1194411695.jpg"),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
