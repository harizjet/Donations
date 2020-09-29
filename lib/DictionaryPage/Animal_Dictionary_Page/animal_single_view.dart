import 'package:flutter/material.dart';
// import 'package:ztour_mobile/Resources/assets.dart';
import 'animal_details.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:ztour_mobile/Widgets/starter_on_boarding.dart';

class AnimalSinglePage extends StatelessWidget {
  static final String path = "lib/src/pages/food/recipe_single.dart";
  final Color icon = Color(0xffEF412D);
  final Color color1 = Color(0xffCF3529);
  final Color color2 = Color(0xffE1372F);
  final Color color3 = Color(0xffFF6C1C);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 350,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [color2, color3],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                )),
            Positioned(
                top: 350,
                left: 0,
                right: 150,
                bottom: 80,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: color1,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50.0))),
                )),
            Positioned(
              top: 350,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                      "Siberian\nTiger".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.0),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "In a small bowl, combine,\ncinnamon, nutmeg and sugar and \nset aside briefly.",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 50.0),
                    SizedBox(
                      height: 30.0,
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.fire, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            "Name",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          Spacer(),
                          VerticalDivider(color: Colors.white),
                          Spacer(),
                          Text(
                            "Zoo Taiping",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                          Spacer(),
                          VerticalDivider(color: Colors.white),
                          Spacer(),
                          Icon(FontAwesomeIcons.stopwatch, color: Colors.white),
                          SizedBox(width: 5.0),
                          Text(
                            "Mammal",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 380,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black38, blurRadius: 30.0)
              ]),
              child: SizedBox(
                height: 350,
                // child: PNetworkImage(photographer),
                //  "logoText":
                //  "https://cdn.pixabay.com/photo/2017/11/06/09/53/animal-2923186_1280.jpg",
                // fit: BoxFit.fill)
                //child: PNetworkImage(meal, fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              top: 325,
              left: 20,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: IconButton(
                    color: icon,
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                    )),
              ),
            ),
            Positioned(
              top: 325,
              right: 20,
              child: RaisedButton(
                child: Text("Read More".toUpperCase()),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AnimalDetailsPage()));
                },
              ),
            ),
            Container(
                height: 70.0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )),
          ],
        ),
      ),
    );
  }
}
