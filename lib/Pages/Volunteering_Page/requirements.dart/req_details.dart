import 'dart:io';

import 'package:flutter/material.dart';
// import '/Animal_Dictionary_Page/home.dart';
// import 'package:ztour_apps1/Pages/Animal_Dictionary_Page/search.dart';
//import 'package:ztour_apps1/Pages/Volunteering_Page/Registrationform/formregistration.dart';

class ReqDetails extends StatelessWidget {
  ReqDetails(this.reqdetails);
  final String reqdetails;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'REQUIREMENTS',
        style: textTheme.subtitle1.copyWith(fontSize: 18.0),
      ),
      SizedBox(height: 20.0),
      Text(
        reqdetails,
        style: textTheme.bodyText2.copyWith(
          color: Colors.black45,
          fontSize: 16.0,
        ),
      ),

      //       Container(
      //         height: 150,
      //             padding: EdgeInsets.only(top: 30, left: 5, right: 2),
      //             child: Card(
      //               elevation: 5.0,
      //               child: Container(
      //                 child: Column(
      //                   children: <Widget>[
      //                     Row(
      //                       children: <Widget>[
      //                         IconButton(
      //                           padding: EdgeInsets.fromLTRB(10,2,2,10),
      //                           icon: Icon(Platform.isIOS
      //                               ? Icons.arrow_forward_ios
      //                               : Icons.arrow_forward),
      //                           onPressed: () => Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                 builder: (_) => AnimalHomePage(),
      //                               )),
      //                         ),
      //                         Text("Come and Join Us!‎",
      //                             style: TextStyle(
      //                                 fontSize: 20.0,
      //                                 fontWeight: FontWeight.bold)),
      //                        /* IconButton(
      //                           icon: Icon(Icons.star_border),
      //                           onPressed: () => Navigator.push(
      //                               context,
      //                               MaterialPageRoute(
      //                                   builder: (_) => VolunteerForm())),
      //                         )*/
      //                       ],
      //                     ),
      //                     Container(
      //                     //  height: 80,
      //                         padding: EdgeInsets.fromLTRB(10.0, 0, 20.0, 16.0),
      //                         child: Text(
      //                           "\nA good chance to give back to society is \nby volunteering.",
      //                           textAlign: TextAlign.justify,
      //                         ))
      //                   ],
      //                 ),
      //               ),
      //             ),
      // )]);

      // ]);
    ]);
  }
}
