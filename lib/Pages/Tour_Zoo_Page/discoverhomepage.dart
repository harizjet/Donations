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

class ZooDestinationPage extends StatelessWidget {
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
                    image: NetworkImage(
                        'https://assets.bharian.com.my/images/articles/Ahmad_Shazrul_Izwanflamingo_1586762745.jpg'),
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
                    child: Text("Places to visit",
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
                        child: _buildPlaceToVisit(
                            image: zoo[0], title: "Zoo Negara"),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsPage())),
                    ),
                    MaterialButton(
                      child: SizedBox(
                        width: 50.0,
                        child: _buildPlaceToVisit(
                            image: zooT[0], title: "Zoo Taiping"),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsPageT())),
                    ),
                    MaterialButton(
                      child: SizedBox(
                        width: 50.0,
                        child: _buildPlaceToVisit(
                            image: zooM[0], title: "Zoo Melaka"),
                      ),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsPageM())),
                    ),
                    MaterialButton(
                        child: SizedBox(
                          width: 50.0,
                          child: _buildPlaceToVisit(
                              image: zoo[1], title: "Zoo Johor"),
                        ),
                        onPressed: () {}),
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
                              child: PNetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQruR2fFwzpyHARPb6GfP1LKhz-g5mICmKafg&usqp=CAU',
                                  fit: BoxFit.cover)),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: PNetworkImage(zoo[2], fit: BoxFit.cover)),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: PNetworkImage(
                                  'https://www.asiaone.com/sites/default/files/original_images/Apr2016/tiger-main.jpg',
                                  fit: BoxFit.cover)),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: PNetworkImage(
                                  'https://storage.findbulous.info/image/travel/upload/19979/re-image3_l.jpg',
                                  fit: BoxFit.cover)),
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
