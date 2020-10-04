import 'package:flutter/material.dart';

import '../../home_volunteer.dart';
import 'horticulture_detail_header.dart';
import 'horticulture_details.dart';
import 'horticulture_model.dart';
//import 'package:ztour_apps1/Pages/Volunteering_Page/field_details.dart';

//import 'promo_api.dart';

class HorticultureDetailsPage extends StatelessWidget {
  HorticultureDetailsPage(this.horticulture);
  final Horticulture horticulture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Horticulture Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorticultureDetailHeader(horticulture),
            // FlatButton(
            //     textColor: Colors.red,
            //     onPressed: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => VolunteerHomePage())),
            //     child: Text("Back")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: HorticultureDetails(horticulture.horticulturedetails),
            ),
            //  PhotoScroller(field.photoUrls),
            SizedBox(height: 20.0),
            //  ActorScroller(movie.actors),
            // SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
