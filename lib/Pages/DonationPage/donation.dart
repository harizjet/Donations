import 'package:flutter/material.dart';
import 'DonationHistory/donationHistory.dart';
import 'donationMethod.dart';
import 'zooOption.dart';
import 'AlertDialog_widget.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  List<PostTransaction> posts = [];
  final controller = TextEditingController();
  int selectitem = 1;
  var listAmount = [
    '1.00',
    '5.00',
    '10.00',
    '20.00',
    '50.00',
    '100.00',
    '1000.00',
  ];
  final FixedExtentScrollController fixedExtentScrollController =
      new FixedExtentScrollController();

  FocusNode input;

  int amount = 0;
  var amountValueTransaction = TextEditingController();

  bool pressed = false;
  bool valid = false;

  Function callBack;

  String zooName = '';

  void click() {
    try {
      if (amountValueTransaction.text.contains('.') == false ||
          input.hasFocus == false)
        amountValueTransaction.text = amountValueTransaction.text + '.00';
      FocusScope.of(context).unfocus();
    } catch (err) {
      FocusScope.of(context).unfocus();
    }

    if (amountValueTransaction.text.split('.')[1].length != 2 ||
        amountValueTransaction.text.split('.').length != 2) {
      amountRequirement(context);
    }
  }

  zooRequirement(BuildContext context) {
    VoidCallback continueCallBack = () => {
          Navigator.of(context).pop(),
        };
    BlurryDialog alert = BlurryDialog(
        "Requirement", "Please select the zoo first.", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void checkvalue(BuildContext context) {
    try {
      if (amountValueTransaction.text == '') {
        zeroamountRequirement(context);
        valid = false;
      } else if (amountValueTransaction.text.split('.')[1].length != 2 ||
          amountValueTransaction.text.split('.').length != 2) {
        amountRequirement(context);
        valid = false;
      } else if (zooName == null || zooName == '') {
        zooRequirement(context);
        valid = false;
      } else {
        valid = true;
      }
    } catch (err) {
      zeroamountRequirement(context);
      valid = false;
    }
  }

  amountRequirement(BuildContext context) {
    VoidCallback continueCallBack = () => {
          Navigator.of(context).pop(),
        };
    BlurryDialog alert = BlurryDialog(
        "Requirement", "Please enter the correct amount.", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  zeroamountRequirement(BuildContext context) {
    VoidCallback continueCallBack = () => {
          Navigator.of(context).pop(),
        };
    BlurryDialog alert = BlurryDialog(
        "Requirement", "Please enter an amount.", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Donation"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            child: FittedBox(
              child: Image.asset('assets/Test.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            child: ListWheelScrollView(
              controller: fixedExtentScrollController,
              squeeze: 0.9,
              onSelectedItemChanged: (int index) {
                this.amountValueTransaction.text = listAmount[index];
              },
              itemExtent: 100,
              diameterRatio: 1.3,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Duit/1.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: 175.0,
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Duit/5.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: 175.0,
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Duit/10.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: 175.0,
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Duit/20.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: 175.0,
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Duit/50.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: 175.0,
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Duit/100.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: 175.0,
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Duit/1000.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: 175.0,
                  height: 50,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 175.0,
              height: 50,
              child: Image.asset('assets/arrowleft.png'),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 175.0,
              height: 50,
              child: Image.asset('assets/arrowright.png'),
            ),
          ),
          Positioned.fill(
            top: 40,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: (MediaQuery.of(context).size.width) / 1.7,
                child: TextField(
                  onSubmitted: (_) => this.click(),
                  keyboardType: TextInputType.number,
                  controller: amountValueTransaction,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(50),
                      ),
                    ),
                    fillColor: Colors.yellow[100],
                    prefixIcon:
                        Padding(padding: EdgeInsets.all(15), child: Text('RM')),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.monetization_on),
                      splashColor: Colors.red,
                      onPressed: this.click,
                    ),
                    labelText: "Input Amount",
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height) - 300,
            child: Container(
              width: (MediaQuery.of(context).size.width),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                        ),
                        child: new ListTile(
                          leading: Icon(Icons.home),
                          trailing: Icon(Icons.arrow_forward_ios),
                          title: Text('Select Zoo'),
                          subtitle: (this.zooName != null)
                              ? Text(this.zooName)
                              : SizedBox.shrink(),
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ZooOptions(),
                              ),
                            );
                            setState(
                              () {
                                this.zooName = result;
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.green[50],
                        ),
                        child: new ListTile(
                          leading: Icon(Icons.account_balance_wallet),
                          trailing: Icon(Icons.arrow_forward_ios),
                          title: Text('Donation Method'),
                          onTap: () => {
                            checkvalue(context),
                            if (valid == true)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DonationMethod(
                                      amountValueTransaction.text
                                          .replaceAll('.', ''),
                                      this.zooName),
                                ),
                              ),
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: new ListTile(
                      leading: Icon(Icons.history),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('Donation History'),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonationHistory(),
                          ),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostTransaction {
  String date;
  String amount;

  PostTransaction(this.date, this.amount);
}

class TransactionList extends StatefulWidget {
  final List<PostTransaction> listItems;

  TransactionList(this.listItems);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  var listItems = PostTransaction('12313212', '213');

  void like(Function callBack) {
    this.setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index) {
        var PostTransaction = this.widget.listItems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(PostTransaction.amount),
                  subtitle: Text(PostTransaction.date),
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.thumb_up),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
