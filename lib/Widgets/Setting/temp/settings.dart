import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:ztour_mobile/Widgets/Setting/language.dart';
import 'package:ztour_mobile/Pages/Login_Signup_Page/user_profile.dart';
import 'AlertDialoglogout.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../../../Pages/Login_Signup_Page/login_page.dart';

class SettingsOnePage extends StatefulWidget {
  static final String path = "lib/Widgets/settings.dart";

  @override
  _SettingsOnePageState createState() => _SettingsOnePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseUser user;

class _SettingsOnePageState extends State<SettingsOnePage> {
  bool _dark;

  @override
  void initState() {
    initUser();
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  static String email = "";
  static String uid = '';
  bool logout = false;

  initUser() async {
    user = await _auth.currentUser();
    setState(() {
      _SettingsOnePageState.email = user.email;
      _SettingsOnePageState.uid = user.uid;
    });
  }

  Future logoutConfirmation(BuildContext context) async {
    VoidCallback continueCallBack = () {
      Navigator.of(context).pop();
      this.logout = true;
    };
    BlurryDialog2nd alert = BlurryDialog2nd(
        "Confirmation", "Are you sure you want to log out?", continueCallBack);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog dialog = new ProgressDialog(context);
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.yellow[50],
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.orange,
          //backgroundColor: Colors.blueGrey,
          title: Text(
            'Settings',
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  _dark = !_dark;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.orange,
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        email,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/6d/cd/94/6dcd94c7c4bf4800648ef7cbe0113c33.gif'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.language,
                            color: Colors.orange,
                          ),
                          title: Text("Language"),
                          subtitle: Text("English US"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LanguagePage()));
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.notifications,
                            color: Colors.orange,
                          ),
                          title: Text("Notifications"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open notification setting
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color: Colors.orange,
                          ),
                          title: Text("Privacy and Security"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open privacy and security
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            Icons.help_outline,
                            color: Colors.orange,
                          ),
                          title: Text("Help & Support"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.orange,
                          ),
                          title: Text("Logout",
                              style: TextStyle(
                                color: Colors.red,
                              )),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () async {
                            await logoutConfirmation(context);

                            if (this.logout == true) {
                              dialog.style(
                                message: 'Please wait...',
                              );
                              await dialog.show();

                              await _auth.signOut();

                              await dialog.hide();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AuthPage(),
                                ),
                              );

                              this.logout = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
