import 'databasedonationbyzoo.dart';
import 'package:flutter/material.dart';

class DonationNumber extends StatefulWidget {
  @override
  _DonationNumberState createState() => _DonationNumberState();
}

class _DonationNumberState extends State<DonationNumber> {
  Widget _body = donationLOADING();

  Map<String, String> donationnumber = {};

  void updatedonationnumber() async {
    await getAllDonationbyzoo().then(
      (numbers) {
        if (mounted)
          setState(
            () {
              this.donationnumber = numbers;
            },
          );
      },
    );
    setState(
      () {
        _body = builddonation(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updatedonationnumber();
  }

  Widget build(BuildContext context) {
    return _body;
  }

  Widget builddonation(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Number'),
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
                      child: Text('Zoo Negara Donation'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("RM ${donationnumber['Zoo Negara']}"),
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
                      child: Text('Zoo Taiping Donation'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("RM ${donationnumber['Zoo Taiping']}"),
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
                      child: Text('Zoo Melaka Donation'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("RM ${donationnumber['Zoo Melaka']}"),
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

class donationLOADING extends StatelessWidget {
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
