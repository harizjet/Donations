import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../Pages/DonationPage/DonationHistory/donationHistory.dart';
import 'package:intl/intl.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'dart:async';

class GraphPage extends StatefulWidget {
  String chosenanimal;

  GraphPage(this.chosenanimal);

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  static List<TimeSeriesAnimal> listspeciesnumber = [];
  static List<charts.Series> seriesList;
  Widget _body = animalmalaysiagraphLOADING();

  Future readExcelforouput() async {
    ByteData data = await rootBundle.load("assets/Animal_malaysia.xlsx");

    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);

    var table = decoder.tables['Sheet1'];

    return table;
  }

  Future animalReading() async {
    var table = await readExcelforouput();
    listspeciesnumber = []; //initiate

    for (int row = 4; row < 35; row++) {
      if (widget.chosenanimal == table.rows[row][0]) {
        for (int col = 1; col < 7; col++) {
          listspeciesnumber.add(
            new TimeSeriesAnimal(
              table.rows[3][col],
              table.rows[row][col],
            ),
          );
        }
      }
    }

    listspeciesnumber.sort(
      (a, b) {
        var adate = a.time;
        var bdate = b.time;
        return -adate.compareTo(bdate);
      },
    );

    seriesList = createchartdata();

    // print(listspeciesnumber.length);

    if (mounted) {
      setState(() {
        _body = animalmalaysiagraphSIAP(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    animalReading();
  }

  //create data
  static List<charts.Series<TimeSeriesAnimal, DateTime>> createchartdata() {
    return [
      new charts.Series<TimeSeriesAnimal, DateTime>(
        id: 'Malaysia Species Graph',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesAnimal animal, _) => animal.time,
        measureFn: (TimeSeriesAnimal animal, _) => animal.numberofspecies,
        data: listspeciesnumber,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  @override
  Widget animalmalaysiagraphSIAP(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(widget.chosenanimal),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow[50],
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Statistik Serahan ${widget.chosenanimal} Kepada Jabatan Perhilitan pada tahun 2013 - 2018",
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
                        blurRadius: 5,
                        color: Colors.white,
                        offset: Offset(1, 1))
                  ],
                ),
                padding: EdgeInsets.all(20),
                width: (MediaQuery.of(context).size.width),
                height: (MediaQuery.of(context).size.height) * 0.5,
                child: charts.TimeSeriesChart(
                  _GraphPageState.seriesList,
                  animate: false,
                  dateTimeFactory: const charts.LocalDateTimeFactory(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class animalmalaysiagraphXDAK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Animal Species Graph"),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height) * 0.5,
          child: Column(
            children: <Widget>[
              Text(
                'NO data just yet',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class animalmalaysiagraphLOADING extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Animal Species Graph"),
        centerTitle: true,
      ),
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

//Create list for timeseriesanimalmalaysia
class TimeSeriesAnimal {
  DateTime time;
  int numberofspecies;

  TimeSeriesAnimal(String timetemp, int numberofspeciestemp) {
    this.time = DateTime.parse('${timetemp.split(' ')[1]}-01-01 00:00:00.000');
    this.numberofspecies = numberofspeciestemp;
  }
}
