import 'package:flutter/material.dart';
import 'package:ztour_mobile/Donationbyzoo/databasedonationbyzoo.dart';
import 'package:ztour_mobile/Donationbyzoo/showdonationbyzoo.dart';
import 'package:ztour_mobile/Pages/Announcement_page/announcement.dart';
import 'package:ztour_mobile/Pages/Announcement_page/zoo_melaka_announcement.dart';
import 'package:ztour_mobile/Pages/Volunteering_Page/Registrationform/formdatabase.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTaiping extends StatefulWidget {
  @override
  _NewsTaipingState createState() => _NewsTaipingState();
}

class _NewsTaipingState extends State<NewsTaiping> {
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
    setState(
      () {
        build(context);
      },
    );
  }

  Widget _body = donationLOADING();

  Map<String, String> donationnumber = {};

  void updatedonationnumber() async {
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
        _body = buildNewsT(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    updateregistrationnumber();
    updatedonationnumber();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  @override
  Widget buildNewsT(BuildContext context) {
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
                false,
                false,
                true,
              ],
              onPressed: (index) => {
                    if (index == 1)
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewsMelaka(),
                          )),
                    if (index == 0)
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => News(),
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
                        "RM ${donationnumber['Zoo Taiping']}",
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
                        "${registrationnumber['Zoo Taiping']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundImage: NetworkImage(zooT[0]),
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
                                    'https://media2.malaymail.com/uploads/articles/2020/2020-08/3tcubs1008.jpg'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        onPressed: () => launch(
                            'https://www.malaymail.com/news/life/2020/08/10/taiping-zoo-and-night-safaris-newborn-cubs-named-puntum-teja-and-bayu-video/1892521')),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Taiping Zoo and Night Safari's newborn cubs named Puntum, Teja and Bayu",
                        style: titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Monday,10 Aug 2020 |",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "SYLVIA LOOI",
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
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Divider(),
          const SizedBox(height: 10.0),
          MaterialButton(
              child: ListTile(
                title: Text(
                  "You’ll Fall In Love With All The Adorable New Baby Animals At Taiping Zoo",
                  style: titleTextStyle,
                ),
                subtitle: Text("BY KIRAT KAUR JULY 23, 2020"),
                trailing: Container(
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.therakyatpost.com/wp-content/uploads/2020/07/taiping-zoo-baby-animals-feature-image.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              onPressed: () => launch(
                  'https://www.therakyatpost.com/2020/07/23/youll-fall-in-love-with-all-the-adorable-new-baby-animals-at-taiping-zoo/')),
          const SizedBox(height: 10.0),
          MaterialButton(
              child: ListTile(
                title: Text(
                  "New norm, strict SOP not stopping crowd from visiting Taiping Zoo",
                  style: titleTextStyle,
                ),
                subtitle: Text("15 JUN 2020 / 18:50 H."),
                trailing: Container(
                  width: 80.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.thesundaily.my/binrepository/768x432/0c0/0d0/none/11808/YVEM/zoo-taiping-v01-arch551469-mg246375-806533-20191129194355_1210751_20200615185023.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              onPressed: () => launch(
                  'https://www.thesundaily.my/local/new-norm-strict-sop-not-stopping-crowd-from-visiting-taiping-zoo-KC2576927')),
        ],
      ),
    );
  }
}
