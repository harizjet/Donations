import 'dart:ui';
import 'package:flutter/material.dart';
import 'existingcard.dart';
import 'package:flushbar/flushbar.dart';

class BlurryDialog3rd extends StatelessWidget {
  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog3rd(this.title, this.content, this.continueCallBack);
  TextStyle textStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: new Text(
            title,
            style: textStyle,
          ),
          content: new Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Save"),
              onPressed: () {
                continueCallBack();
              },
            ),
            new FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                var count = 0;
                Navigator.popUntil(
                  context,
                  (route) {
                    return count++ == 2;
                  },
                );

                ExistingCardsPage.confirmation = false;

                Flushbar(
                  icon: Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.all(8),
                  borderRadius: 8,
                  title: 'Cancel',
                  message: 'Card Saving Cancelled',
                  duration: Duration(seconds: 3),
                )..show(context);
              },
            ),
          ],
        ));
  }
}
