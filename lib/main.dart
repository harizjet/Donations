import 'package:flutter/material.dart';

import 'Pages/Login_Signup_Page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Widgets/BottomBar/bottom_bar.dart';
import 'splahkreen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseUser user;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // static String email = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ztour',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
