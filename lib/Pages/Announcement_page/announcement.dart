import 'package:flutter/material.dart';
import 'package:ztour_mobile/Donationbyzoo/databasedonationbyzoo.dart';
import 'package:ztour_mobile/Donationbyzoo/showdonationbyzoo.dart';
import 'package:ztour_mobile/Pages/Announcement_page/newspaper.dart';
import 'package:ztour_mobile/Pages/Announcement_page/zoo_melaka_announcement.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/Registrationform/formdatabase.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Map<String, int> registrationnumber = {};
  int initnum = 0;

  void updateregistrationnumber() async {
    await getAllRegistration().then(
      (numbers) {
        if (mounted)
          setState(
            () {
              this.registrationnumber = numbers;
            },
          );
        else
          setState(() {
            this.registrationnumber = (initnum) as Map<String, int>;
          });
      },
    );
    await getAllDonationbyzoo().then(
      (numbers) {
        if (mounted)
          setState(
            () {
              this.donationnumber = numbers;
            },
          );
      },
    );
    setState(
      () {
        _body = buildNews(context);
      },
    );
  }

  Widget _body = donationLOADING();

  Map<String, String> donationnumber = {};

  // void updatedonationnumber() async {

  //   setState(
  //     () {
  //       _body = buildNews(context);
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    updateregistrationnumber();
    // updatedonationnumber();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  @override
  Widget buildNews(BuildContext context) {
    final Color bgColor = Color(0xffF3F3F3);
    final Color primaryColor = Color(0xffE70F0B);

    var titleTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    var teamNameTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade800,
    );
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Feed"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ToggleButtons(
              fillColor: primaryColor,
              hoverColor: primaryColor,
              renderBorder: true,
              borderColor: Colors.grey.shade300,
              color: Colors.grey.shade800,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.solidNewspaper),
                      const SizedBox(height: 16.0),
                      Text(
                        "Zoo\nNegara",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.newspaper),
                      const SizedBox(height: 16.0),
                      Text("Zoo\nMelaka"),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 32.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.newspaper),
                      const SizedBox(height: 16.0),
                      Text("Zoo\nTaiping"),
                    ],
                  ),
                ),
              ],
              isSelected: [
                true,
                false,
                false,
              ],
              onPressed: (index) => {
                    if (index == 2)
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewsTaiping(),
                          )),
                    if (index == 1)
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewsMelaka(),
                          )),
                  }),
          const SizedBox(height: 16.0),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sponsor",
                        style: teamNameTextStyle,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "RM ${donationnumber['Zoo Negara']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0),
                    child: Text(
                      "|",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Volunteer",
                        style: teamNameTextStyle,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "${registrationnumber['Zoo Negara']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(zoo[0]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    MaterialButton(
                        child: Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://assets.hmetro.com.my/images/articles/Zoo_Negara2_1598962979.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        onPressed: () => launch(
                            'https://www.hmetro.com.my/mutakhir/2020/09/616219/zoo-melaka-dan-zoo-negara-jalin-kerjasama')),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Zoo Melaka dan Zoo Negara jalin kerjasama",
                        style: titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Selasa, 1 September 2020",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "CSR event",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20.0,
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Divider(),
          const SizedBox(height: 10.0),
          MaterialButton(
              child: ListTile(
                title: Text(
                  "MCO: Zoo Negara needs urgent donations",
                  style: titleTextStyle,
                ),
                subtitle: Text("Monday,20 March 2020, 7:02 PM | Bernama"),
                trailing: Container(
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://apicms.thestar.com.my/uploads/images/2020/03/30/624624.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              onPressed: () => launch(
                  'https://www.thestar.com.my/news/nation/2020/03/30/mco-zoo-negara-needs-urgent-donations')),
          const SizedBox(height: 10.0),
          MaterialButton(
              child: ListTile(
                title: Text(
                  "Students adopt Kiki, the rhinoceros hornbill",
                  style: titleTextStyle,
                ),
                subtitle: Text("Monday, 24 Aug 2020| The Star"),
                trailing: Container(
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://apicms.thestar.com.my/uploads/images/2020/08/24/830705.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              onPressed: () => launch(
                  'https://www.thestar.com.my/news/nation/2020/03/30/mco-zoo-negara-needs-urgent-donations')),
        ],
      ),
    );
  }
}
