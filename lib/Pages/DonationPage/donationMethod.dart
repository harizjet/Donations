import 'package:flutter/material.dart';
import 'CreditMethod/existingcard.dart';
import 'CreditMethod/payment-services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'AlertDialog2nd_widget.dart';
import 'package:intl/intl.dart';
import 'DonationHistory/donationHistory.dart';
import 'CreditMethod/cardForm.dart';
import 'AlertDialog_widget.dart';

class DonationMethod extends StatefulWidget {
  String amountValueTransaction;
  String zooName;

  DonationMethod(this.amountValueTransaction, this.zooName);

  @override
  _DonationMethodState createState() => _DonationMethodState();
}

class _DonationMethodState extends State<DonationMethod> {
  bool pressedCredit = false;
  bool pressedBanking = false;

  bool cardSelected = false;
  bool creditSelected = false;

  bool bankSelected = false;
  bool pressedMaybank = false;
  bool pressedCimb = false;
  bool pressedPublic = false;
  bool pressedRHBNow = false;
  bool pressedAmbank = false;
  bool pressedMyBSN = false;

  String cardNumber;

  // This would be where we try to check for the validation process.
  cardvalidation() {}

  cardselectprocess() {
    for (var i = 0;
        i <
            ExistingCardsPage(
              widget.amountValueTransaction,
              widget.zooName,
            ).cardslist().length;
        i++) {
      if (ExistingCardsPage(
            widget.amountValueTransaction,
            widget.zooName,
          ).cardslist()[i].CardNumber ==
          this.cardNumber) {
        return ExistingCardsPage(
          widget.amountValueTransaction,
          widget.zooName,
        ).cardslist()[i];
      }
    }
  }

  fpxBANK(BuildContext context) {
    VoidCallback continueCallBack = () => {
          Navigator.of(context).pop(),
        };
    BlurryDialog alert = BlurryDialog(
        "Sorry", "This method is not available as of now!", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> confirmationProcess(BuildContext context) async {
    VoidCallback continueCallBack = () => {
          setState(() {
            ExistingCardsPage.confirmation = true;
          }),
          Navigator.of(context).pop(),
        };
    BlurryDialog2nd alert = BlurryDialog2nd(
        "Confirmation", "Are you sure you want to continue?", continueCallBack);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  Future findresult() async {
    var result;
    do {
      result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExistingCardsPage(
            widget.amountValueTransaction,
            widget.zooName,
          ),
        ),
      );
      if (result == '') {
        setState(() {
          this.creditSelected = false;
        });
      }
      if (result != null) {
        break;
      }
    } while (result != null || result != '');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Donation Method"),
        centerTitle: true,
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return new ListView(
            children: <Widget>[
              // widget.amountValueTransaction, widget.zooName

              Container(
                height: (MediaQuery.of(context).size.height) * 0.25,
                width: (MediaQuery.of(context).size.width),
                child: Carousel(
                  images: [
                    Image.asset('assets/Donationslide/donatedifference.png'),
                    Image.asset('assets/Donationslide/changetoday.png'),
                    Image.asset('assets/Donationslide/thankyou.jpg')
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black26),
                        bottom: BorderSide(color: Colors.black26),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              if (creditSelected == true &&
                                  pressedCredit == true)
                                Icon(Icons.done_outline),
                              if (pressedCredit == true)
                                Icon(Icons.keyboard_arrow_up),
                              if (pressedCredit == false)
                                Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          leading: Icon(Icons.credit_card),
                          title: Text('Credit / Debit Card'),
                          onTap: () async {
                            if (pressedCredit == false) {
                              setState(() {
                                pressedCredit = true;
                              });
                            } else if (pressedCredit == true) {
                              setState(() {
                                pressedCredit = false;
                              });
                            }
                          },
                        ),
                        if (pressedCredit)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                  top: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                title: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (creditSelected) Icon(Icons.done),
                                    ],
                                  ),
                                  leading: Icon(Icons.person),
                                  title: Text('Existing Card'),
                                  subtitle: (this.cardNumber != null &&
                                          bankSelected == false)
                                      ? Text(this.cardNumber)
                                      : SizedBox.shrink(),
                                  onTap: () async {
                                    bankSelected = false;
                                    creditSelected = false;
                                    this.cardNumber = '';
                                    String result = await findresult();

                                    setState(
                                      () {
                                        this.cardNumber = result;
                                      },
                                    );

                                    if (this.cardNumber != null &&
                                        this.cardNumber != '')
                                      this.creditSelected = true;
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (pressedCredit)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                title: ListTile(
                                  leading: Icon(Icons.add_box),
                                  title: Text('Add New Credit/Debit Card'),
                                  onTap: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CardForm(),
                                      ),
                                    );

                                    // var response =
                                    //     await StripeService.payWithNewCard(
                                    //   amount: widget.amountValueTransaction,
                                    //   currency: 'MYR',
                                    // );
                                    // Scaffold.of(context).showSnackBar(
                                    //   SnackBar(
                                    //     content: Text(response.message),
                                    //     duration:
                                    //         new Duration(milliseconds: 3500),
                                    //   ),
                                    // );
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (pressedCredit)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(35, 10, 0, 10),
                              child: Container(
                                child: Text(
                                    'I acknowledge that by saving my card, One time Password (OTP) might not be required for transactions on Ztour'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black26),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                            width: 35,
                            height: 60,
                            child: Image.asset('assets/Bank/FPX.png'),
                          ),
                          title: Text('Online Banking'),
                          onTap: () async {
                            if (pressedBanking == false) {
                              setState(() {
                                pressedBanking = true;
                              });
                            } else if (pressedBanking == true) {
                              setState(() {
                                pressedBanking = false;
                              });
                            }
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              if (pressedBanking == true &&
                                  bankSelected == true)
                                Icon(Icons.done_outline),
                              if (pressedBanking == true)
                                Icon(Icons.keyboard_arrow_up),
                              if (pressedBanking == false)
                                Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                        if (pressedBanking)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                  top: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    if (pressedMaybank && bankSelected)
                                      Icon(Icons.done),
                                  ],
                                ),
                                leading: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                    width: 35,
                                    height: 60,
                                    child:
                                        Image.asset('assets/Bank/maybank.png'),
                                  ),
                                ),
                                title: Text('Maybank2u'),
                                onTap: () async {
                                  bankSelected = false;
                                  creditSelected = false;
                                  setState(
                                    () {
                                      bankSelected = true;
                                      cardSelected = false;

                                      pressedMaybank = true;
                                      pressedCimb = false;
                                      pressedPublic = false;
                                      pressedRHBNow = false;
                                      pressedAmbank = false;
                                      pressedMyBSN = false;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        if (pressedBanking)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                  top: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (pressedCimb && bankSelected)
                                        Icon(Icons.done),
                                    ],
                                  ),
                                  leading: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Container(
                                        width: 35,
                                        height: 60,
                                        child:
                                            Image.asset('assets/Bank/cimb.jpg'),
                                      )),
                                  title: Text('Cimb Clicks'),
                                  onTap: () async {
                                    bankSelected = false;
                                    creditSelected = false;
                                    setState(
                                      () {
                                        bankSelected = true;
                                        cardSelected = false;

                                        pressedMaybank = false;
                                        pressedCimb = true;
                                        pressedPublic = false;
                                        pressedRHBNow = false;
                                        pressedAmbank = false;
                                        pressedMyBSN = false;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        if (pressedBanking)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                  top: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (pressedPublic && bankSelected)
                                        Icon(Icons.done),
                                    ],
                                  ),
                                  leading: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Container(
                                        width: 35,
                                        height: 60,
                                        child: Image.asset(
                                            'assets/Bank/public.jpg'),
                                      )),
                                  title: Text('Public Bank'),
                                  onTap: () async {
                                    bankSelected = false;
                                    creditSelected = false;
                                    setState(
                                      () {
                                        bankSelected = true;
                                        cardSelected = false;

                                        pressedMaybank = false;
                                        pressedCimb = false;
                                        pressedPublic = true;
                                        pressedRHBNow = false;
                                        pressedAmbank = false;
                                        pressedMyBSN = false;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        if (pressedBanking)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                  top: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (pressedRHBNow && bankSelected)
                                        Icon(Icons.done),
                                    ],
                                  ),
                                  leading: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Container(
                                        width: 35,
                                        height: 60,
                                        child:
                                            Image.asset('assets/Bank/rhb.jpg'),
                                      )),
                                  title: Text('RHB Now'),
                                  onTap: () async {
                                    bankSelected = false;
                                    creditSelected = false;
                                    setState(
                                      () {
                                        bankSelected = true;
                                        cardSelected = false;

                                        pressedMaybank = false;
                                        pressedCimb = false;
                                        pressedPublic = false;
                                        pressedRHBNow = true;
                                        pressedAmbank = false;
                                        pressedMyBSN = false;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        if (pressedBanking)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                  top: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (pressedAmbank && bankSelected)
                                        Icon(Icons.done),
                                    ],
                                  ),
                                  leading: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Container(
                                        width: 35,
                                        height: 60,
                                        child: Image.asset(
                                            'assets/Bank/ambank.jpg'),
                                      )),
                                  title: Text('Ambank'),
                                  onTap: () async {
                                    bankSelected = false;
                                    creditSelected = false;
                                    setState(
                                      () {
                                        bankSelected = true;
                                        cardSelected = false;

                                        pressedMaybank = false;
                                        pressedCimb = false;
                                        pressedPublic = false;
                                        pressedRHBNow = false;
                                        pressedAmbank = true;
                                        pressedMyBSN = false;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        if (pressedBanking)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black26),
                                  top: BorderSide(color: Colors.black26),
                                ),
                              ),
                              child: ListTile(
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      if (pressedMyBSN && bankSelected)
                                        Icon(Icons.done),
                                    ],
                                  ),
                                  leading: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Container(
                                      width: 35,
                                      height: 60,
                                      child: Image.asset('assets/Bank/bsn.png'),
                                    ),
                                  ),
                                  title: Text('MyBSN'),
                                  onTap: () async {
                                    bankSelected = false;
                                    creditSelected = false;
                                    setState(
                                      () {
                                        bankSelected = true;
                                        cardSelected = false;

                                        pressedMaybank = false;
                                        pressedCimb = false;
                                        pressedPublic = false;
                                        pressedRHBNow = false;
                                        pressedAmbank = false;
                                        pressedMyBSN = true;
                                      },
                                    );
                                  }),
                            ),
                          ),
                        if (pressedBanking)
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(),
                              ),
                              child: ListTile(
                                  leading: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Container(
                                      width: 35,
                                      height: 60,
                                      child:
                                          Image.asset('assets/Bank/sample.jpg'),
                                    ),
                                  ),
                                  title: Text('LastBanking Sample'),
                                  onTap: () async {}),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(5),
          child: RaisedButton(
            color: (bankSelected || creditSelected) ? Colors.red : Colors.grey,
            onPressed: () async {
              if (bankSelected) {
                fpxBANK(context);
              }
              if (creditSelected) {
                var card = await cardselectprocess();

                await confirmationProcess(context);

                await ExistingCardsPage(
                  widget.amountValueTransaction,
                  widget.zooName,
                ).payExistingCard(context, card, widget.amountValueTransaction);

                DateTime time = new DateTime.now().toLocal();
                DateTime now = new DateTime(
                    time.year,
                    time.month,
                    time.day,
                    time.hour,
                    time.minute,
                    time.second,
                    time.millisecond,
                    //     '${DateFormat('yyyy-MM-dd').format(now)}  ${DateFormat.jm().format(now)}',
                    time.microsecond);

                NewDonation.newdonation(
                  '${widget.zooName}',
                  '${DateFormat('yyyy-MM-dd hh:mm').format(new DateTime.fromMillisecondsSinceEpoch(time.millisecondsSinceEpoch, isUtc: false))}',
                  'RM ${(int.parse(widget.amountValueTransaction) / 100).toStringAsFixed(2)}',
                  ExistingCardsPage.confirmation,
                  '${DateFormat('yyyy-MM-dd hh:mm').format(new DateTime.fromMillisecondsSinceEpoch(time.millisecondsSinceEpoch, isUtc: false))}',
                );
              }
            },
            child: Text(
              'CONFIRM',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
