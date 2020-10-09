import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ztour_mobile/Pages/Quiz_Game_Page/quizhomepage.dart';

import 'Pages/Login_Signup_Page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Widgets/BottomBar/bottom_bar.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseUser user;

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static String uid = '';

  initUser() async {
    user = await _auth.currentUser();
    try {
      setState(
        () {
          _SplashScreenState.uid = user.uid;
        },
      );
    } catch (err) {
      setState(
        () {
          _SplashScreenState.uid = null;
        },
      );
    }
    if (_SplashScreenState.uid == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => AuthPage(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => AnimatedBottomBar(),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      initUser();
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

// class LOADING extends StatefulWidget {
//   @override
//   _LOADINGState createState() => _LOADINGState();
// }

// class _LOADINGState extends State<LOADING> {
//   @override
//   Widget build(BuildContext context) {
//     return CircularProgressIndicator();
//   }
// }
