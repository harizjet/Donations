import 'package:flutter/material.dart';
import 'package:ztour_mobile/Resources/network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'AlertDialoglogout.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'splashscreenlogin.dart';

//2
final FirebaseAuth _auth = FirebaseAuth.instance;

const TextStyle boldText = TextStyle(
  fontWeight: FontWeight.bold,
);

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FirebaseUser user;
  bool signupForm;
  @override
  void initState() {
    super.initState();
    signupForm = true;
  }

  double fontsizeselected = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red[300],
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     "ZTOUR MOBILE ",
      //     style: TextStyle(color: Colors.black, fontSize: 30.0),
      //   ),
      // ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Colors.red[900]),
              height: 400,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight - 16.0),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Logodict/2.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: (MediaQuery.of(context).size.height / 2) - 120,
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: ToggleButtons(
                          renderBorder: false,
                          selectedColor: Colors.blue[800],
                          fillColor: Colors.transparent,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontFamily: "Quando",
                                  fontSize: signupForm ? 18 : fontsizeselected,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontFamily: "Quando",
                                  fontSize: !signupForm ? 18 : fontsizeselected,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                          isSelected: [signupForm, !signupForm],
                          onPressed: (index) {
                            setState(() {
                              signupForm = index == 0;
                            });
                          },
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: Duration(
                          milliseconds: 200,
                        ),
                        child: signupForm ? SignUp() : SignIn(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  final String title = 'Signup';
  @override
  State<StatefulWidget> createState() => _Signup();
}

class _Signup extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String tempmessagesignup = '';
  bool _success = false;
  String _userEmail;

  Future signupValidation(
      BuildContext context, String title, String message) async {
    VoidCallback continueCallBack = () {
      Navigator.of(context).pop();
    };
    BlurryDialod3rd alert = BlurryDialod3rd(title, message, continueCallBack);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(16.0),
                    hintText: "enter your email",
                  ),
                  controller: _emailController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(height: 16.0),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(
                      16.0,
                    ),
                    hintText: "password",
                    prefixStyle: boldText.copyWith(color: Colors.black),
                  ),
                  controller: _passwordController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: RaisedButton(
                  elevation: 0,
                  highlightElevation: 0,
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await _register();
                      if (_success == true) {
                        signupValidation(context, "Congrats",
                            "Your account have successfully been registered!");
                      } else {
                        signupValidation(
                            context, 'Sign up Failed', tempmessagesignup);
                      }
                    }
                  },
                  child: Text("Sign Up"),
                ),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Text(
              //     _success == null
              //         ? ''
              //         : (_success
              //             ? '\t\t\t\t\t\t\tSuccessfully register as ' +
              //                 _userEmail +
              //                 '\n\n\t\t\t\t\t\t\tPlease Login.'
              //             : 'Sign up failed'),
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
              const SizedBox(height: 10.0),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future _register() async {
    ProgressDialog dialog = new ProgressDialog(context);

    dialog.style(
      message: 'Please wait...',
    );
    await dialog.show();

    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        setState(() {
          _success = false;
        });
      }
    } catch (err) {
      setState(() {
        tempmessagesignup = err.toString().split(',')[1];
        _success = false;
      });
    }
    await dialog.hide();
  }
}

//This section is for login pages
class SignIn extends StatefulWidget {
  final String title = 'Signin';
  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success = false;
  String _userEmail;

  String tempmessage = '';

  Future validationConfirmation(BuildContext context, String message) async {
    VoidCallback continueCallBack = () {
      Navigator.of(context).pop();
    };
    BlurryDialod3rd alert =
        BlurryDialod3rd("Sign in Failed", message, continueCallBack);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(16.0),
                  hintText: "enter your email or phone",
                ),
                controller: _emailController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
            const SizedBox(height: 16.0),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: const EdgeInsets.all(
                    16.0,
                  ),
                  hintText: "password",
                  prefixStyle: boldText.copyWith(color: Colors.black),
                ),
                controller: _passwordController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 32.0,
              ),
              child: RaisedButton(
                elevation: 0,
                highlightElevation: 0,
                textColor: Colors.white,
                color: Colors.blueAccent,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await _signInWithEmailAndPassword();
                    if (_success == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SplashScreenlogin(),
                        ),
                      );
                    } else {
                      validationConfirmation(context, tempmessage);
                    }
                  }
                },
                child: Text("Sign In"),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future _signInWithEmailAndPassword() async {
    ProgressDialog dialog = new ProgressDialog(context);

    dialog.style(
      message: 'Please wait...',
    );
    await dialog.show();

    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        setState(() {
          _success = false;
        });
      }
    } catch (err) {
      setState(() {
        tempmessage = err.toString().split(',')[1];
        _success = false;
      });
    }

    await dialog.hide();
  }
}
