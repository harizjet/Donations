import 'package:flutter/material.dart';

class DonationHistory extends StatefulWidget {
  @override
  _DonationHistoryState createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  static List<Donation> donations = [];
  // void newpost(String text) { functionthat add the new instance
  //   this.setState(() {
  //     donations.add(new Donation(text, widget.name));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation History'),
        centerTitle: true,
        backgroundColor: Colors.green,
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
  ) {
    _DonationHistoryState.donations.add(
      new Donation(zoo, date, amount, result),
    );
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
  String Message;

  Donation([this.Zoo, this.Date, this.Amount, this.Result]) {
    if (Result == true) {
      this.Message = 'Success';
    } else {
      this.Message = 'Failed';
    }
  }
}
