import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultpage.dart';
import 'package:meta/meta.dart';

class getjson extends StatelessWidget {
  // accept the langname as a parameter

  String langname;
  getjson(this.langname);
  String assettoload;

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setasset() {
    if (langname == "EASY") {
      assettoload = "assets/easy.json";
    } else if (langname == "MEDIUM") {
      assettoload = "assets/medium.json";
    } else if (langname == "HARD") {
      assettoload = "assets/hard.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    // this function is called before the build so that
    // the string assettoload is available to the DefaultAssetBuilder
    setasset();
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

// ignore: must_be_immutable
class quizpage extends StatefulWidget {
  final List mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);

  @override
  _quizpageState createState() => _quizpageState(mydata: mydata);
}

class _quizpageState extends State<quizpage> {
  final List mydata;
  _quizpageState({this.mydata});

  Color colortoshow = Color(0xFF231d3c);
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  // extra variable to iterate
  int j = 0;
  int timer = 20;
  String showtimer = "20";
  var random_array;

  Map<String, Color> btncolor = {
    "a": Color(0xFF231d3c),
    "b": Color(0xFF231d3c),
    "c": Color(0xFF231d3c),
    "d": Color(0xFF231d3c),
  };

  bool canceltimer = false;

  // code inserted for choosing questions randomly
  // to create the array elements randomly use the dart:math module
  // -----     CODE TO GENERATE ARRAY RANDOMLY

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int i = 0;;) {
      distinctIds.add(rand.nextInt(10) + 1);
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  //   var random_array;
  //   var distinctIds = [];
  //   var rand = new Random();
  //     for (int i = 0; ;) {
  //     distinctIds.add(rand.nextInt(10));
  //       random_array = distinctIds.toSet().toList();
  //       if(random_array.length < 10){
  //         continue;
  //       }else{
  //         break;
  //       }
  //     }
  //   print(random_array);

  // ----- END OF CODE
  // var random_array = [1, 6, 7, 2, 4, 10, 8, 3, 9, 5];

  // overriding the initstate function to start timer as this screen is created
  @override
  void initState() {
    starttimer();
    genrandomarray();
    nextquestion();
    super.initState();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 20;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Color(0xFF231d3c);
      btncolor["b"] = Color(0xFF231d3c);
      btncolor["c"] = Color(0xFF231d3c);
      btncolor["d"] = Color(0xFF231d3c);
      disableAnswer = false;
    });
    starttimer();
  }

  void checkanswer(String k) {
    // in the previous version this was
    // mydata[2]["1"] == mydata[1]["1"][k]
    // which i forgot to change
    // so make sure that this is now corrected
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      // just a print statement to check the correct working
      // debugPrint(mydata[2][i.toString()] + " is equal to " + mydata[1][i.toString()][k]);
      marks = marks + 5;
      // changing the color variable to be green
      colortoshow = right;
    } else {
      // just a print statement to check the correct working
      // debugPrint(mydata[2]["1"] + " is equal to " + mydata[1]["1"][k]);
      colortoshow = wrong;
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    // nextquestion();
    // changed timer duration to 1 second
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20.0,
        ),
        child: MaterialButton(
          onPressed: () => checkanswer(k),
          child: Text(
            mydata[1][i.toString()][k],
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Alike",
              fontSize: 16.0,
            ),
            maxLines: 1,
          ),

          // CircleAvatar(radius: 10, backgroundColor: Colors.white)
          color: btncolor[k],
          splashColor: Color(0xFF231d3c),
          highlightColor: Color(0xFF231d3c),
          minWidth: 350.0,
          height: 40.0,
          shape: RoundedRectangleBorder(
            borderRadius: (BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10))),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quizstar",
                  ),
                  content: Text("You Can't Go Back At This Stage."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20, bottom: 20)),
            Container(
              padding: EdgeInsets.all(20.0),
              height: 180,
              width: 900,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/4.jpg"), fit: BoxFit.fill),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Quando",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: AbsorbPointer(
                absorbing: disableAnswer,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choicebutton('a'),
                      choicebutton('b'),
                      choicebutton('c'),
                      choicebutton('d'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
