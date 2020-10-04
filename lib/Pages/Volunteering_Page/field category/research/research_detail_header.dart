import 'dart:io';

import 'package:flutter/material.dart';
import 'arc_banner_research.dart';

//import 'arc_banner_research.dart';
import 'research_model.dart';

// import 'arc_banner_image.dart';
// import 'models.dart';
// import 'poster.dart';

class ResearchDetailHeader extends StatelessWidget {
  ResearchDetailHeader(this.research);
  final Research research;

  // List<Widget> _buildCategoryChips(TextTheme textTheme) {
  //   return field.categories.map((category) {
  //     return Padding(
  //       padding: const EdgeInsets.only(right: 8.0),
  //       child: Chip(
  //         label: Text(category),
  //         labelStyle: textTheme.caption,
  //         backgroundColor: Colors.black12,
  //       ),
  //     );
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ArcBannerResearch(research.bannerUrl);

    //var fieldInformation =

    // Container(
    //             padding: EdgeInsets.only(top: 240, left: 5),
    //             child: Card(
    //               elevation: 5.0,
    //               child: Container(
    //                 child: Column(
    //                   children: <Widget>[
    //                     Row(
    //                       children: <Widget>[
    //                         IconButton(
    //                           icon: Icon(Platform.isIOS
    //                               ? Icons.arrow_forward_ios
    //                               : Icons.arrow_forward),
    //                           onPressed: () => Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                 builder: (_) => SearchAnimal(),
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
    //                         padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 16.0),
    //                         child: Text(
    //                           "\nA good chance to give back to society is \nby volunteering.",
    //                           textAlign: TextAlign.justify,
    //                         ))
    //                   ],
    //                 ),
    //               ),
    //             ),
    // );
    //         ),Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: [
    //   Text(
    //     field.title,
    //     style: textTheme.headline6,
    //   ),
    // SizedBox(height: 50.0);
    // RatingInformation(movie),
    // SizedBox(height: 12.0),
    // Row(children: _buildCategoryChips(textTheme)),
    // ],
    // );

    //  Stack(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(bottom: 140.0),
    //       child: ArcBannerImage(field.bannerUrl),
    //     ),
    //     // Positioned(
    //     //   bottom: 0.0,
    //     //   left: 16.0,
    //     //   right: 16.0,
    //     //   child: Row(
    //     //     crossAxisAlignment: CrossAxisAlignment.end,
    //     //     mainAxisAlignment: MainAxisAlignment.end,
    //     //     children: [
    //     //       Poster(
    //     //         field.posterUrl,
    //     //         height: 180.0,
    //     //       ),
    //           SizedBox(width: 16.0),
    //         //  Expanded(child: fieldInformation),
    //         ]);
    //   ),
    // ),
    //  ],
    // );
  }
}
