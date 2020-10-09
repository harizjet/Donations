import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:ztour_mobile/Pages/Tour_Zoo_Page/zoo_album.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ztour_mobile/AnimalGraphMampu/animalgraph.dart';

import 'package:ztour_mobile/Pages/AnimalNews/views/newshomepage.dart';

import 'package:ztour_mobile/Pages/Announcement_page/announcement.dart';
import 'package:ztour_mobile/Pages/Covid19/covidhomepage.dart';

import 'package:ztour_mobile/Pages/DonationPage/donation_view.dart';

import '../../Pages/Volunteering_Page/home_volunteer.dart';

import 'package:ztour_mobile/Pages/Volunteering_Page/home_volunteer.dart';

import 'WebsiteView.dart';

class DetailsPage extends StatelessWidget {
  final String image = "assets/Zoo/Negara/1.jpg";
  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height * 0.9;
    double boxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Zoo Negara"),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.red[300],
                            textColor: Colors.white,
                            child: Text(
                              "Google Earth",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                            onPressed: () => launch(
                                'https://earth.google.com/earth/rpc/cc/drive?state=%7B%22ids%22%3A%5B%221emVWzMOIKGq5hZw10VMBLbbL9eFtXew-%22%5D%2C%22action%22%3A%22open%22%2C%22userId%22%3A%22103372052462390541200%22%7D&usp=sharing')),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          child: Text(
                            "Experience VR Mode",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebsiteView(
                                  'VR',
                                  'Zoo Negara',
                                  postUrl:
                                      'https://poly.google.com/u/0/view/a6anly0V7HA',
                                ),
                              ),
                            );
                          },
                        ),
                        // => launch(
                        //     'https://poly.google.com/u/0/view/a6anly0V7HA')),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.red[600],
                          textColor: Colors.white,
                          child: Text(
                            "Zoo Album",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => GalleryPageOne(),
                              )),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.red[900],
                          textColor: Colors.white,
                          child: Text(
                            "Official Website",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebsiteView(
                                  'Website',
                                  'Zoo Negara',
                                  postUrl:
                                      'https://www.zoonegaramalaysia.my/index.htm',
                                ),
                              ),
                            );
                          },
                        ),
                        // => launch(
                        //     'https://www.zoonegaramalaysia.my/index.htm'),
                        // ),
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                      ),
                      width: boxWidth,
                      height: boxHeight,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: boxWidth,
                            height: boxHeight * (1 / 3),
                            padding: EdgeInsets.all(10),
                            child: Carousel(
                              images: [
                                Image.asset('assets/Zoo/Negara/1.jpg'),
                                Image.asset('assets/Zoo/Negara/2.jpg'),
                                Image.asset('assets/Zoo/Negara/3.jpg'),
                                Image.asset('assets/Zoo/Negara/4.jpg'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Card(
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Information",
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.black38,
                                          ),
                                          Container(
                                              child: Column(
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(Icons.person),
                                                title: Text("Name"),
                                                subtitle: Text("Zoo Negara"),
                                              ),
                                              ListTile(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 10),
                                                leading:
                                                    Icon(Icons.my_location),
                                                title: Text("Location"),
                                                subtitle: Text(
                                                    "Zoo Negara, Hulu Kelang, 68000 Ampang,Selangor\nDarul Ehsan, Malaysia"),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.email),
                                                title: Text("Email"),
                                                subtitle: Text(
                                                    "customerservice@zoonegaramalaysia.my"),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.phone),
                                                title: Text("Phone"),
                                                subtitle:
                                                    Text("+603-4108 3422/7/8"),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Activity {
  final String title;
  final IconData icon;
  final Widget action;
  Activity({this.title, this.icon, this.action});
}

final List<Activity> activities = [
  Activity(
    title: "Social Works",
    icon: FontAwesomeIcons.calendarDay,
    action: VolunteerHomePage(),
  ),
  Activity(
    title: "Animal Care",
    icon: FontAwesomeIcons.dollarSign,
    action: ToDoPage(),
  ),
  Activity(
    title: "Covid19",
    icon: FontAwesomeIcons.info,
    action: HomePageCovid(),
  ),
  Activity(
      title: "Animal News",
      icon: FontAwesomeIcons.newspaper,
      action: AnimalNewsPage()),
];
