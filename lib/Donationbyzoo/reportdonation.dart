/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Donationbyzoo/showdonationbyzoo.dart';

import 'databasedonationbyzoo.dart';

class ReportDonation extends StatefulWidget {
  @override
  _ReportDonationState createState() => _ReportDonationState();
}

class _ReportDonationState extends State<ReportDonation> {
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
        _body = buildReport(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updatedonationnumber();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  final TextStyle whiteText = TextStyle(color: Colors.white);
  @override
  Widget buildReport(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Fund Donation"),
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
          const SizedBox(height: 50.0),
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
                              "\n\nRM ${donationnumber['Zoo Negara']}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.dollarSign,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '\nZoo Negara',
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
                              "",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.heartbeat,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "TOTAL",
                              style: whiteText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "RM ${(double.parse(donationnumber['Zoo Negara']) + double.parse(donationnumber['Zoo Melaka']) + double.parse(donationnumber['Zoo Taiping'])).toStringAsFixed(2)}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
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
                              "RM ${donationnumber['Zoo Taiping']}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.dollarSign,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '\Zoo Taiping ',
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
                              "\n\nRM ${donationnumber['Zoo Melaka']}",
                              style:
                                  Theme.of(context).textTheme.display1.copyWith(
                                        fontSize: 24.0,
                                        color: Colors.black,
                                      ),
                            ),
                            trailing: Icon(
                              FontAwesomeIcons.dollarSign,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              '\nZoo Melaka',
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
                "Overall\nDonation",
                style:
                    TextStyle(color: Colors.black87).copyWith(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              Text(
                "RM ${(double.parse(donationnumber['Zoo Negara']) + double.parse(donationnumber['Zoo Melaka']) + double.parse(donationnumber['Zoo Taiping'])).toStringAsFixed(2)}",
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ],
          ),
        )
      ],
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
