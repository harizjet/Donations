import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../DonationPage/DonationHistory/donationHistory.dart';
import 'getdonationdatabaseforalluser.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  static List<TimeSeriesDonation> listdonationsdata = [];
  static List<charts.Series> seriesList;
  Widget _body = graphLOADING();

  void updateData() async {
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
                _GraphPageState.listdonationsdata = donations;
              },
            );
        },
      );
    } catch (err) {
      _GraphPageState.listdonationsdata.length = 0;
    }
    if (_GraphPageState.listdonationsdata.length == 0) {
      setState(
        () {
          _body = graphXDAK();
        },
      );
    } else {
      setState(
        () {
          _body = graphSIAP();
        },
      );
    }
  }

  void cumulative() async {
    for (int x = _GraphPageState.listdonationsdata.length - 2; x >= 0; x--) {
      _GraphPageState.listdonationsdata[x].donation =
          (_GraphPageState.listdonationsdata[x].donation +
              _GraphPageState.listdonationsdata[x + 1].donation);
    }
  }

  @override
  void initState() {
    super.initState();
    updateData();
    cumulative();
    seriesList = createchartdata();
  }

  //create data
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

  @override
  Widget build(BuildContext context) {
    return _body;
  }
}

class graphSIAP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Graph'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height) * 0.5,
          child: charts.TimeSeriesChart(
            _GraphPageState.seriesList,
            animate: false,
            dateTimeFactory: const charts.LocalDateTimeFactory(),
          ),
        ),
      ),
    );
  }
}

class graphXDAK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Graph'),
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

class graphLOADING extends StatelessWidget {
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

//Create list for timeseriesdonation
class TimeSeriesDonation {
  DateTime time;
  int donation;

  TimeSeriesDonation(String timetemp, String donationtemp) {
    this.time = DateTime.parse('$timetemp');
    this.donation = int.parse(donationtemp.split(' ')[1].split('.')[0]);
  }
}

TimeSeriesDonation createTimeseries(record) {
  Map<String, String> attributes = {
    'Date': '',
    'Amount': '',
  };

  record.forEach(
    (key, value) => {
      if (key == 'Date' || key == 'Amount')
        {
          attributes[key] = value,
        }
    },
  );

  TimeSeriesDonation donation = new TimeSeriesDonation(
    attributes['Date'],
    attributes['Amount'],
  );
  return donation;
}
