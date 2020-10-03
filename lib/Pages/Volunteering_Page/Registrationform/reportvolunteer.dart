/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'formdatabase.dart';

class ReportV extends StatefulWidget {
  @override
  _ReportVState createState() => _ReportVState();
}

class _ReportVState extends State<ReportV> {
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
        _body = buildReportV(context);
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

  final TextStyle whiteText = TextStyle(color: Colors.white);
  @override
  Widget buildReportV(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Number of Volunteer by Zoo"),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          _buildHeader(),
          const SizedBox(height: 50.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 190,
                      color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "\n\n ${registrationnumber['Zoo Negara']}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.fire,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '\nZOO NEGARA',
                              style: whiteText,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 120,
                      color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "${registrationnumber['All zoos']}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "TOTAL \nREGISTRATION",
                              style: whiteText,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 120,
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              " ${registrationnumber['Zoo Taiping']}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.peopleCarry,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '\nZOO TAIPING ',
                              style: whiteText,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 190,
                      color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "${registrationnumber['Zoo Melaka']}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        fontSize: 30.0,
                                        color: Colors.black,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.peopleCarry,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '\n\nZOO MELAKA',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            backgroundColor: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Overall\nRegistration",
                style:
                    TextStyle(color: Colors.black87).copyWith(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              Text(
                "${registrationnumber['All zoos']}",
                style: TextStyle(color: Colors.green, fontSize: 30.0),
              ),
            ],
          ),
        )
      ],
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
