import 'package:flutter/material.dart';
import 'package:ztour_mobile/Resources/network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "ZTOUR MOBILE ",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
      body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight - 16.0),
                Container(
                  alignment: Alignment.topCenter,
                  height: (MediaQuery.of(context).size.height / 2) - 150,
                  child: PNetworkImage(
                    'https://images.fineartamerica.com/images/artworkimages/mediumlarge/2/1-white-rhinoceros-isolated-on-white-background-susan-schmitz.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(5, 5),
                          blurRadius: 10.0,
                        )
                      ]),
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
                          selectedColor: Colors.pink,
                          fillColor: Colors.transparent,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Sign Up",
                                style: boldText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Sign In",
                                style: boldText,
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
  bool _success;
  String _userEmail;

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
                      _register();
                    }
                  },
                  child: Text("Sign In"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  _success == null
                      ? ''
                      : (_success
                          ? '\t\t\t\t\t\t\tSuccessfully register as ' +
                              _userEmail +
                              '\n\n\t\t\t\t\t\t\tPlease Login.'
                          : 'Sign up failed'),
                  style: TextStyle(color: Colors.red),
                ),
              ),
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

  void _register() async {
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
        _success = false;
      });
    }
  }
}

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
                      _signInWithEmailAndPassword();
                      if (_success == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AnimatedBottomBar(),
                            ));
                      }
                    }
                  },
                  child: Text("Sign In"),
                ),
              ),
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

  void _signInWithEmailAndPassword() async {
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
      print(2342);
      setState(() {
        _success = false;
      });
    }
  }
}
