import 'package:flutter/material.dart';
//import 'package:ztour_apps1/Pages/Volunteering_Page/field_details.dart';


//import 'promo_api.dart';
import '../home_volunteer.dart';
import 'req_detail_header.dart';
import 'req_details.dart';
import 'req_model.dart';

class ReqDetailsPage extends StatelessWidget {
  ReqDetailsPage(this.req);
  final Req req;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReqDetailHeader(req),
            FlatButton(
                      textColor: Colors.red,
                      onPressed: () => Navigator.push(
                        context, MaterialPageRoute(builder: (_) => VolunteerHomePage())),
                      child: Text("Back")),
  
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ReqDetails(req.reqdetails),
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