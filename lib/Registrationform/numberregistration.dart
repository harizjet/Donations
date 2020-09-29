import 'formdatabase.dart';
import 'package:flutter/material.dart';

class RegistrationNumber extends StatefulWidget {
  @override
  _RegistrationNumberState createState() => _RegistrationNumberState();
}

class _RegistrationNumberState extends State<RegistrationNumber> {
  Widget _body = registrationLOADING();

  Map<String, int> registrationnumber = {};

  void updateregistrationnumber() async {
    await getAllRegistration().then(
      (numbers) {
        if (mounted)
          setState(
            () {
              this.registrationnumber = numbers;
            },
          );
      },
    );
    setState(
      () {
        _body = buildregistration(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updateregistrationnumber();
  }

  Widget build(BuildContext context) {
    return _body;
  }

  Widget buildregistration(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Number'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text('Total Registration'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("${registrationnumber['All zoos']}"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text('Zoo Negara Registration'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("${registrationnumber['Zoo Negara']}"),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text('Zoo Taiping Registration'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("${registrationnumber['Zoo Taiping']}"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text('Zoo Melaka Registration'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("${registrationnumber['Zoo Melaka']}"),
                    ),
                  ],
                ),
              ),
              // ],)
            ],
          ),
        ),
      ),
    );
  }
}

class registrationLOADING extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height) * 0.5,
          child: Column(
            children: <Widget>[
              Text(
                'Please Wait......',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
