import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ztour_mobile/Pages/Quiz_Game_Page/quizhomepage.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';

class SplashScreenlogin extends StatefulWidget {
  _SplashScreenloginState createState() => _SplashScreenloginState();
}

class _SplashScreenloginState extends State<SplashScreenlogin> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => AnimatedBottomBar(),
      ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF7C229),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Logodict/3.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
