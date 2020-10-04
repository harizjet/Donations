import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ztour_mobile/Pages/Quiz_Game_Page/quizhomepage.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => quizhomepage(),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7C229),
      body: Center(
          child: Text("Quiz Time!",
              style: TextStyle(fontSize: 50.0, fontFamily: "Satisfy"))),
    );
  }
}
