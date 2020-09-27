import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:credit_card_input_form/credit_card_input_form.dart';
import '../AlertDialog3rd.dart';
import 'existingcard.dart';

class CardForm extends StatefulWidget {
  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  static bool validornot = true;
  static bool alreadyexist;
  static var cardNUMBER;
  static var valiDATE;
  static var nAME;
  static var cVV;

  cardconfirmation(BuildContext context) {
    _CardFormState.alreadyexist = true;
    VoidCallback continueCallBack = () {
      for (var i = 0;
          i < ExistingCardsPage('12', '123').cardslist().length;
          i++) {
        if (_CardFormState.cardNUMBER ==
            ExistingCardsPage('12', '123').cardslist()[i]) {
          _CardFormState.alreadyexist = true;
        }
      }

      var count = 0;
      Navigator.popUntil(context, (route) {
        return count++ == 2;
      });
      if (_CardFormState.alreadyexist == false) {
        Flushbar(
          icon: Icon(
            Icons.info_outline,
            color: Colors.blue,
          ),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          title: 'Duplicates',
          message: 'This card number already exists!',
          duration: Duration(seconds: 3),
        )..show(context);
      } else if (_CardFormState.validornot == true) {
        Flushbar(
          icon: Icon(
            Icons.info_outline,
            color: Colors.blue,
          ),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          title: 'Success',
          message: 'Your card have been saved successuflly',
          duration: Duration(seconds: 3),
        )..show(context);

        NewCard.newcard(_CardFormState.cardNUMBER, _CardFormState.valiDATE,
            _CardFormState.nAME, _CardFormState.cVV);
      } else {
        Flushbar(
          icon: Icon(
            Icons.info_outline,
            color: Colors.blue,
          ),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          title: 'Failed',
          message: 'Please try again.',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    };
    BlurryDialog3rd alert = BlurryDialog3rd(
        "Confirmation", "Are you sure you want to save?", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static bool validateDate(String value) {
    if (value.isEmpty) {
      return false;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(new RegExp(r'(\/)'))) {
      var split = value.split(new RegExp(r'(\/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return false;
    }

    var fourDigitsYear = year + 2000;
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid year should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return false;
    }

    return true;
  }

  // translate and customize captions
  final Map<String, String> customCaptions = {
    'PREV': 'Prev',
    'NEXT': 'Next',
    'DONE': 'Done',
    'CARD_NUMBER': 'Card Number',
    'CARDHOLDER_NAME': 'Cardholder Name',
    'VALID_THRU': 'Valid Thru',
    'SECURITY_CODE_CVC': 'Security Code (CVC)',
    'NAME_SURNAME': 'Name Surname',
    'MM_YY': 'MM/YY',
    'RESET': 'Reset',
  };

  final buttonStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    gradient: LinearGradient(
        colors: [
          const Color(0xfffcdf8a),
          const Color(0xfff38381),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp),
  );

  final cardDecoration = BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black54, blurRadius: 15.0, offset: Offset(0, 8))
      ],
      gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.orange,
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
      borderRadius: BorderRadius.all(Radius.circular(15)));

  final buttonTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

  static bool validateCVV(String value) {
    if (value.isEmpty) {
      return false;
    }

    if (value.length < 3 || value.length > 4) {
      return false;
    }
    return true;
  }

  static creditCardValidator(String value) {
    value = value.replaceAll(' ', '');
    int intvalue = int.parse(value);
    if (value.length < 16) {
      return false;
    } else if ((num.tryParse(value) != null) == false) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _CardFormState.validornot = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Form'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: Container(
            color: Colors.yellow[200],
            alignment: Alignment.topCenter,
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: CreditCardInputForm(
              showResetButton: false,
              onStateChange: (currentState, cardInfo) async {
                try {
                  if (currentState.toString() ==
                      'InputState.DONE') if (creditCardValidator(
                          cardInfo.cardNumber) ==
                      false) {
                    _CardFormState.validornot = false;
                  }
                  if (currentState.toString() ==
                      'InputState.DONE') if (_CardFormState.validateDate(
                          cardInfo.validate) ==
                      false) {
                    _CardFormState.validornot = false;
                  }
                  if (currentState.toString() ==
                      'InputState.DONE') if (_CardFormState.validateCVV(
                          cardInfo.cvv) ==
                      false) {
                    _CardFormState.validornot = false;
                  }
                } catch (err) {
                  _CardFormState.validornot = false;
                }

                if (currentState.toString() == 'InputState.DONE') {
                  cardconfirmation(context);
                  _CardFormState.cardNUMBER = cardInfo.cardNumber;
                  _CardFormState.valiDATE = cardInfo.validate;
                  _CardFormState.nAME = cardInfo.cvv;
                  _CardFormState.cVV = cardInfo.cvv;
                }
              },
              customCaptions: customCaptions,
              frontCardDecoration: cardDecoration,
              backCardDecoration: cardDecoration,
            ),
          ),
        ),
      ),
    );
  }
}
