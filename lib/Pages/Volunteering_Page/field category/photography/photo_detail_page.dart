import 'package:flutter/material.dart';

import '../../home_volunteer.dart';
import 'photo_detail_header.dart';
import 'photo_details.dart';
import 'photo_model.dart';
//import 'package:ztour_apps1/Pages/Volunteering_Page/field_details.dart';

//import 'promo_api.dart';

class PhotoDetailsPage extends StatelessWidget {
  PhotoDetailsPage(this.photography);
  final Photography photography;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Photographer Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PhotoDetailHeader(photography),
            // FlatButton(
            //     textColor: Colors.red,
            //     onPressed: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => VolunteerHomePage())),
            //     child: Text("Back")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: PhotoDetails(photography.photodetails),
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
