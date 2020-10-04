import 'package:flutter/material.dart';
//import 'package:ztour_apps1/Pages/Volunteering_Page/field_details.dart';

//import 'promo_api.dart';
import '../../home_volunteer.dart';
import 'research_detail_header.dart';
import 'research_details.dart';
import 'research_model.dart';

class ResearchDetailsPage extends StatelessWidget {
  ResearchDetailsPage(this.research);
  final Research research;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Researcher Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResearchDetailHeader(research),
            // FlatButton(
            //     textColor: Colors.red,
            //     onPressed: () => Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => VolunteerHomePage())),
            //     child: Text("Back")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ResearchDetails(research.researchdetails),
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
