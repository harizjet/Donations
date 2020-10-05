import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ztour_mobile/Pages/Announcement_page/announcement.dart';
import 'package:ztour_mobile/Pages/Tour_Zoo_Page/list.dart';
import 'package:ztour_mobile/Pages/Tour_Zoo_Page/zoo_Melaka.dart';
import 'package:ztour_mobile/Pages/Tour_Zoo_Page/zoo_detail.dart';
import 'package:ztour_mobile/Pages/Tour_Zoo_Page/zoo_Taiping.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:ztour_mobile/Resources/network_image.dart';
import 'package:ztour_mobile/Widgets/BottomBar/bottom_bar.dart';
import 'AlertDialogTourZoo.dart';

class ZooDestinationPage extends StatelessWidget {
  Future comingSoon(BuildContext context) async {
    VoidCallback continueCallBack = () {
      Navigator.of(context).pop();
    };
    BlurryDialog alert = BlurryDialog(
        "Sorry", "Coming soon in the near future!", continueCallBack);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        elevation: 0.5,
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            "Zoo Tour",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Quando",
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                //color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage('assets/discover/cover.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 300),
              // Container(
              //   padding: EdgeInsets.only(top: 200, left: 40),
              //   child: Card(
              //     elevation: 5.0,
              //     child: Container(
              //       child: Column(
              //         children: <Widget>[
              //           Row(
              //             children: <Widget>[
              //               IconButton(
              //                 icon: Icon(Platform.isIOS
              //                     ? Icons.arrow_back_ios
              //                     : Icons.arrow_back),
              //                 onPressed: () => Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (_) => AnimatedBottomBar(),
              //                     )),
              //               ),
              //               Text("Zoos & Aquariums\n in Malaysia‎",
              //                   style: TextStyle(
              //                       fontSize: 20.0,
              //                       fontWeight: FontWeight.bold)),
              //               IconButton(
              //                 icon: Icon(Icons.star_border),
              //                 onPressed: () => Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (_) => AnimatedBottomBar())),
              //               )
              //             ],
              //           ),
              //           Container(
              //               padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 16.0),
              //               child: Text(
              //                 "\nExplore our Malaysia",
              //                 textAlign: TextAlign.justify,
              //               ))
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Select Zoo",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  FlatButton(
                      textColor: Colors.red,
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PlaceList1())),
                      child: Text("See All")),
                ],
              ),
              Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MaterialButton(
                      child: SizedBox(
                        width: 50.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 70,
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/zoo-logo.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Zoo Negara')
                          ],
                        ),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsPage())),
                    ),
                    MaterialButton(
                      child: SizedBox(
                        width: 50.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 70,
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/taiping.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Zoo Taiping')
                          ],
                        ),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsPageT())),
                    ),
                    MaterialButton(
                      child: SizedBox(
                        width: 50.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 70,
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/melaka.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Zoo Melaka')
                          ],
                        ),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsPageM())),
                    ),
                    MaterialButton(
                      child: SizedBox(
                        width: 50.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 70,
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/johor.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Zoo Johor')
                          ],
                        ),
                      ),
                      onPressed: () {
                        comingSoon(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: PNetworkImage(zoo[2],
                                height: 180, fit: BoxFit.cover))),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0),
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/images.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/zirrafe.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/tiger-main.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  //color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/discover/gajah.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceToVisit({String image, String title}) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: PNetworkImage(
            image,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(title)
      ],
    );
  }
}
