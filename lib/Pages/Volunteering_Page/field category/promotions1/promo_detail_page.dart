import 'package:flutter/material.dart';
//import 'package:ztour_apps1/Pages/Volunteering_Page/field_details.dart';

//import 'promo_api.dart';
import '../../home_volunteer.dart';
import 'promo_detail_header.dart';
import 'promo_details.dart';
import 'promo_model.dart';

class PromoDetailsPage extends StatelessWidget {
  PromoDetailsPage(this.promo);
  final Promo promo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Promoter Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PromoDetailHeader(promo),
            // FlatButton(
            //     textColor: Colors.red,
            //     onPressed: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => VolunteerHomePage())),
            //     child: Text("Back")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PromoDetails(promo.promodetails),
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
