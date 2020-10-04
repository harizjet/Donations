import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'databasedonation.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DonationHistory extends StatefulWidget {
  DonationHistory();

  @override
  _DonationHistoryState createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  static List<Donation> donations = [];
  Widget _body = donationLOADING();

  void updateDonations() async {
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
              _DonationHistoryState.donations = donations;
            },
          );
      },
    );
    setState(
      () {
        _body = donationSIAP();
      },
    );
    // print(_DonationHistoryState.donations.toString());
  }

  @override
  void initState() {
    super.initState();
    updateDonations();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
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

class donationSIAP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Donation History"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: DonationList(_DonationHistoryState.donations)),
          // TextInputWidget(this.newpost)
        ],
      ),
    );
  }
}

class NewDonation {
  static void newdonation(
    String zoo,
    String date,
    String amount,
    bool result,
    String datefully,
  ) async {
    var donation = Donation(zoo, date, amount, result, datefully);

    if (zoo == 'Zoo Negara') {
      negaraDonation(donation);
    }

    if (zoo == 'Zoo Taiping') {
      taipingDonation(donation);
    }

    if (zoo == 'Zoo Melaka') {
      melakaDonation(donation);
    }

    if (result == true) {
      totalDonation(donation);
    }
    donation.setId(await saveDonation(donation));
    _DonationHistoryState.donations.add(donation);
  }
}

class DonationList extends StatefulWidget {
  final List<Donation> listItems;

  DonationList(this.listItems);

  @override
  _DonationListState createState() => _DonationListState();
}

class _DonationListState extends State<DonationList> {
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
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.widget.listItems.length,
        itemBuilder: (context, index) {
          var donation = this.widget.listItems[index];
          return Card(
              color: donation.Result ? Colors.lightGreen[400] : Colors.red[100],
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
        });
  }
}

class Donation {
  String Zoo;
  String Date;
  String Amount;
  bool Result;
  String Datefully;
  String Message;
  DatabaseReference _id;

  Donation([this.Zoo, this.Date, this.Amount, this.Result, this.Datefully]) {
    if (Result == true) {
      this.Message = 'Success';
    } else {
      this.Message = 'Failed';
    }
  }

  //write
  void setId(DatabaseReference id) {
    this._id = id;
  }

  //write
  Map<String, dynamic> toJson() {
    return {
      'Zoo': this.Zoo,
      'Date': this.Date,
      'Amount': this.Amount,
      'Result': this.Result,
    };
  }

  //write
  Map<String, dynamic> toJsonSpecial() {
    return {
      'Zoo': this.Zoo,
      'Date': this.Datefully,
      'Amount': this.Amount,
      'Result': this.Result,
    };
  }
}

//read
Donation createDonation(record) {
  Map<String, dynamic> attributes = {
    'Zoo': '',
    'Date': '',
    'Amount': '',
    'Result': '',
  };

  record.forEach(
    (key, value) => {
      attributes[key] = value,
    },
  );

  Donation donation = new Donation(
    attributes['Zoo'],
    attributes['Date'],
    attributes['Amount'],
    attributes['Result'],
  );
  return donation;
}
