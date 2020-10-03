import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:ztour_mobile/Donationbyzoo/reportdonation.dart';
import 'package:ztour_mobile/Donationbyzoo/showdonationbyzoo.dart';
import 'package:ztour_mobile/Pages/DonationPage/adopt.dart';
import 'package:ztour_mobile/Pages/DonationPage/donation.dart';
import 'package:ztour_mobile/Pages/DonationPage/DonationHistory/donationHistory.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';

TextEditingController _textFieldController = TextEditingController();

class ToDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orangeTextStyle = TextStyle(
      color: Colors.deepOrange,
    );
    double boxHeight = MediaQuery.of(context).size.height * 0.5;
    double boxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            "Sponsor Type",
            style: Theme.of(context).textTheme.display1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 16.0),
          Card(
            child: Column(
              children: <Widget>[
                Container(
                  width: boxWidth,
                  height: boxHeight * (2 / 3),
                  padding: EdgeInsets.all(10),
                  child: Carousel(
                    images: [
                      Image.asset('assets/Donationslide/donatedifference.png'),
                      Image.asset('assets/Donationslide/changetoday.png'),
                      Image.asset('assets/Donationslide/thankyou.jpg')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  child: _buildWikiCategory(FontAwesomeIcons.dollarSign, "Fund",
                      Colors.deepOrange.withOpacity(0.7)),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ReportDonation())),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: MaterialButton(
                    child: _buildWikiCategory(FontAwesomeIcons.delicious,
                        "Food Donation", Colors.blue.withOpacity(0.6)),
                    onPressed: () => {print(DateTime.now().toLocal())}
                    // Navigator.push(context,
                    //  MaterialPageRoute(builder: (_) => DonationHistory())),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  child: _buildWikiCategory(FontAwesomeIcons.hireAHelper,
                      "Animal Adoption", Colors.indigo.withOpacity(0.7)),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Adopt())),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: MaterialButton(
                    child: _buildWikiCategory(
                        FontAwesomeIcons.file, "Others", Colors.greenAccent),
                    onPressed: () => {}
                    //Navigator.push(context,
                    //   MaterialPageRoute(builder: (_) => DonationHistory())),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5.0,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AnimatedBottomBar(),
                  )),
              color: Colors.deepOrange,
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
            const SizedBox(width: 16.0),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => DonationPage())),
        color: Colors.green,
        child: Icon(Icons.add),
        textColor: Colors.white,
        minWidth: 0,
        elevation: 4.0,
        padding: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Adding channel'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Please enter some text"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Row _buildChannelListItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.circle,
          size: 16.0,
        ),
        const SizedBox(width: 10.0),
        Text(title),
        Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  Stack _buildWikiCategory(IconData icon, String label, Color color) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(26.0),
          alignment: Alignment.centerRight,
          child: Opacity(
              opacity: 0.3,
              child: Icon(
                icon,
                size: 40,
                color: Colors.white,
              )),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(height: 16.0),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
