import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ztour_mobile/Graph/graph.dart';
import 'package:ztour_mobile/Pages/Login_Signup_Page/login_page.dart';
import 'package:ztour_mobile/Pages/Login_Signup_Page/user_profile.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/Registrationform/numberregistration.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/Registrationform/reportvolunteer.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';
import 'package:ztour_mobile/Widgets/Setting/settings.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String email = '';

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {
      String email = user.email;
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ClipPath(
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 40),
            decoration: BoxDecoration(
                color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
            width: 300,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.power_settings_new,
                          color: active,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AuthPage()));
                          _auth.signOut();
                        },
                      ),
                    ),
                    Container(
                      height: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange])),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/6d/cd/94/6dcd94c7c4bf4800648ef7cbe0113c33.gif'),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Hi',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      this.email,
                      style: TextStyle(color: active, fontSize: 16.0),
                    ),
                    SizedBox(height: 30.0),
                    ListTile(
                      leading: Icon(
                        Icons.home,
                      ),
                      title: Text("Welcome"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AnimatedBottomBar(),
                          )),
                    ),
                    _build2Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.person_pin,
                      ),
                      title: Text("My Profile"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Profile(),
                          )),
                      //open change password
                    ),
                    _build2Divider(),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Setting"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SettingsOnePage(),
                          )),
                    ),
                    _build2Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.history,
                      ),
                      title: Text("Report Volunteer"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReportV(),
                          )),
                    ),
                    _build2Divider(),
                    ListTile(
                      leading: Icon(Icons.graphic_eq),
                      title: Text("Graph Donation"),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GraphPage(),
                          )),
                    ),
                    _build2Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.feedback,
                      ),
                      title: Text("Feedback"),
                      onTap: () {
                        //open change location
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _build2Divider() {
    return Divider(
      color: divider,
    );
  }
}
