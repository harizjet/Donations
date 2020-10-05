/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
  */
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../../Graph/getdonationdatabaseforalluser.dart';
import '../../Graph/graph.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Donationbyzoo/showdonationbyzoo.dart';

import '../../Donationbyzoo/databasedonationbyzoo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ztour_mobile/Pages/DonationPage/DonationHistory/databasedonation.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:ztour_mobile/Pages/DonationPage/DonationHistory/donationHistory.dart';

class DonationData extends StatefulWidget {
  @override
  _DonationDataState createState() => _DonationDataState();
}

class _DonationDataState extends State<DonationData> {
  Widget _body = donationLOADING();
  static List<TimeSeriesDonation> listdonationsdata = [];
  static List<charts.Series> seriesList;
  static List<Donation> donationsindividual = [];

  Map<String, String> donationnumber = {};

  void updatedonationnumber() async {
    await getAllDonations().then(
      (donations) {
        donations.sort(
          (a, b) {
            var adate = DateTime.parse(a.Date);
            var bdate = DateTime.parse(b.Date);
            return -adate.compareTo(bdate);
          },
        );

        if (mounted)
          setState(
            () {
              _DonationDataState.donationsindividual = donations;
            },
          );
      },
    );

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
    try {
      await getAllDonationforallUsers().then(
        (donations) {
          donations.sort(
            (a, b) {
              var adate = a.time;
              var bdate = b.time;
              return -adate.compareTo(bdate);
            },
          );
          if (mounted)
            setState(
              () {
                _DonationDataState.listdonationsdata = donations;
              },
            );
        },
      );
    } catch (err) {
      _DonationDataState.listdonationsdata.length = 0;
    }
    cumulative();
    seriesList = createchartdata();

    setState(
      () {
        _body = buildReport(context);
      },
    );
  }

  void cumulative() async {
    for (int x = _DonationDataState.listdonationsdata.length - 2; x >= 0; x--) {
      print(_DonationDataState.listdonationsdata[x].time);
      _DonationDataState.listdonationsdata[x].donation =
          (_DonationDataState.listdonationsdata[x].donation +
              _DonationDataState.listdonationsdata[x + 1].donation);
    }
    for (int x = _DonationDataState.listdonationsdata.length - 2; x >= 0; x--) {
      if (DateFormat('yyyy-MM-dd')
              .format(_DonationDataState.listdonationsdata[x].time) ==
          DateFormat('yyyy-MM-dd')
              .format(_DonationDataState.listdonationsdata[x + 1].time)) {
        _DonationDataState.listdonationsdata.removeAt(x + 1);
      }
    }
    for (int x = 0; x < _DonationDataState.listdonationsdata.length; x++) {
      _DonationDataState.listdonationsdata[x].time = DateTime.parse(
          DateFormat('yyyy-MM-dd')
              .format(_DonationDataState.listdonationsdata[x].time));
    }
  }

  static List<charts.Series<TimeSeriesDonation, DateTime>> createchartdata() {
    return [
      new charts.Series<TimeSeriesDonation, DateTime>(
        id: 'Total Donation',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesDonation donations, _) => donations.time,
        measureFn: (TimeSeriesDonation donations, _) => donations.donation,
        data: listdonationsdata,
      )
    ];
  }

  chooseImage(String zooName) {
    if (zooName == 'Zoo Negara') {
      return AssetImage('assets/Zoo/Negara/4.jpg');
    } else if (zooName == 'Zoo Taiping') {
      return AssetImage('assets/Zoo/Taiping/1.jpg');
    } else {
      return AssetImage('assets/Zoo/Melaka/1.jpg');
    }
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
        title: Text("Donation Data"),
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
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Personal Donation History",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: ListView.builder(
                itemCount: donationsindividual.length,
                itemBuilder: (context, index) {
                  var donation = donationsindividual[index];
                  return Card(
                      color: donation.Result
                          ? Colors.lightGreen[400]
                          : Colors.red[100],
                      child: Row(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: chooseImage(donation.Zoo),
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: 65,
                            height: 50,
                          ),
                        ),
                        Expanded(
                            child: ListTile(
                                title: Text(
                                  donation.Zoo,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(donation.Date))),
                        Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                donation.Amount,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            ),
                            Container(
                              child: Text(
                                donation.Message,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 15,
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            )
                          ],
                        )
                      ]));
                }),
          ),
          SizedBox(height: 50),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Total Donations Graph",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.brown),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5, color: Colors.white, offset: Offset(1, 1))
                ],
              ),
              padding: EdgeInsets.all(20),
              width: (MediaQuery.of(context).size.width),
              height: (MediaQuery.of(context).size.height) * 0.5,
              child: charts.TimeSeriesChart(
                _DonationDataState.seriesList,
                animate: false,
                dateTimeFactory: const charts.LocalDateTimeFactory(),
              ),
            ),
          ),
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
