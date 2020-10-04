import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ztour_mobile/AnimalGraphMampu/animalgraph.dart';
import 'package:ztour_mobile/Donationbyzoo/showdonationbyzoo.dart';
import 'package:ztour_mobile/Pages/AnimalNews/views/newshomepage.dart';
import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/dictionaryhome.dart';
import 'package:ztour_mobile/Pages/Announcement_page/announcement.dart';
import 'package:ztour_mobile/Pages/Covid19/covidhomepage.dart';
import 'package:ztour_mobile/Pages/DonationPage/donation.dart';
import 'package:ztour_mobile/Pages/DonationPage/donation_view.dart';
import 'package:ztour_mobile/Pages/Login_Signup_page/user_profile.dart';
import '../../Pages/Volunteering_Page/home_volunteer.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/Registrationform/formregistration.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/home_volunteer.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/Registrationform/reportvolunteer.dart';
import '../../Donationbyzoo/reportdonation.dart';
import 'package:ztour_mobile/Widgets/MenuBar/menubar1.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      // drawer: NavDrawer(),
    );
  }

  _buildBody(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height * 0.8;
    double boxWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  width: boxWidth,
                  height: boxHeight * (1 / 3),
                  padding: EdgeInsets.all(10),
                  child: Carousel(
                    images: [
                      Image.asset('assets/Donationslide/donatedifference.png'),
                      Image.asset('assets/Donationslide/changetoday.png'),
                      Image.asset('assets/Donationslide/thankyou.jpg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.fromLTRB(33, 16, 16, 16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Dash Boards',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                ),
              ],
            ),
          ),
        ),
        _buildStats(),
        _buildActivities(context),
      ],
    );
  }

  SliverPadding _buildStats() {
    final TextStyle stats = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white);
    return SliverPadding(
      padding: const EdgeInsets.all(10.0),
      sliver: SliverGrid.count(
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        children: <Widget>[
          // Container(
          //     padding: EdgeInsets.all(5),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     child: RaisedButton(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10.0)),
          //       color: Colors.red,
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: <Widget>[
          //           Icon(
          //             Icons.attach_money,
          //           ),
          //           const SizedBox(height: 5.0),
          //           Text(
          //             "Sponsor",
          //             style: TextStyle(
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.w500,
          //                 fontSize: 18.0),
          //           ),
          //         ],
          //       ),
          //       onPressed: () => Navigator.push(
          //           context, MaterialPageRoute(builder: (_) => ToDoPage())),
          //     )),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.people,
                    ),
                    const SizedBox(height: 1.0),
                    Text(
                      "Volunteer",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0),
                    ),
                  ],
                ),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ReportV()))),
          ),
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.yellow,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.monetization_on),
                    const SizedBox(height: 5.0),
                    Text(
                      "Donation",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0),
                    ),
                  ],
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ReportDonation())),
              )),
        ],
      ),
    );
  }

  SliverPadding _buildActivities(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(17.0),
      sliver: SliverToBoxAdapter(
        child: _buildTitledContainer(
          "Activities",
          height: 570,
          child: Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: activities
                  .map(
                    (activity) => Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Theme.of(context).buttonColor,
                          child: activity.icon != null
                              ? RaisedButton(
                                  child: Icon(
                                    activity.icon,
                                    size: 36.0,
                                  ),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => activity.action,
                                      )),
                                )
                              : null,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          activity.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      elevation: 0.5,
      backgroundColor: Colors.orange,
      title: Center(
        child: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Quando",
            fontSize: 25.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return IconButton(
      iconSize: 40,
      padding: EdgeInsets.all(0),
      icon: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/originals/6d/cd/94/6dcd94c7c4bf4800648ef7cbe0113c33.gif'),
        ),
      ),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Profile(),
          )),
    );
  }

  Container _buildTitledContainer(String title, {Widget child, double height}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          if (child != null) ...[const SizedBox(height: 10.0), child]
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
  Activity(
      title: "Zoos Article",
      icon: FontAwesomeIcons.speakerDeck,
      action: News()),
  Activity(
      title: "Statistics",
      icon: FontAwesomeIcons.fileAlt,
      action: animalhomepage()),
];
