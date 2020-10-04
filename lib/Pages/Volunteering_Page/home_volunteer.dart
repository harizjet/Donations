import 'dart:io';
import 'package:flutter/material.dart';
import '../../Pages/Animal_Dictionary_Page/search.dart';
import 'field%20category/horticulture/horticulture_api.dart';
import 'field%20category/horticulture/horticulture_detail_page.dart';
import 'field%20category/photography/photo_api.dart';
import 'field%20category/photography/photo_detail_page.dart';
import 'field%20category/promotions1/promo_api.dart';
import 'field%20category/promotions1/promo_detail_page.dart';
import 'field%20category/research/research_api.dart';
import 'field%20category/research/research_detail_page.dart';
import 'requirements.dart/req_api.dart';
import 'vol_gallery.dart';
import 'Registrationform/formregistration.dart';
import '../../Pages/Animal_Dictionary_Page/network_image.dart';
import 'assets.dart';
import 'requirements.dart/req_detail_page.dart';

class VolunteerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Social Works"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/12/14/11/55/volunteers-3874924_1280.png'),
                    fit: BoxFit.cover)),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 320, left: 5),
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegistrationForm(),
                              )),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.arrow_forward_ios),
                              Text("  Click Here to Join Us!‎",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 16.0),
                            child: Text(
                              "\nPlease read the terms and condition before applying to be a volunteer.",
                              textAlign: TextAlign.justify,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5),
                child: Card(
                  elevation: 5.0,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Platform.isIOS
                                  ? Icons.note
                                  //arrow_forward_ios
                                  : Icons.note),
                              //arrow_forward),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ReqDetailsPage(testReq),
                                  )),
                            ),
                            Text("Terms & Condition‎",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Field to volunteer\n")),
                  // FlatButton(
                  //     textColor: Colors.red,
                  //     onPressed: () {},
                  //     child: Text("See All")),
                ],
              ),
              Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MaterialButton(
                      child: SizedBox(
                        child: _buildField(image: zoo[0], title: "Promotions"),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PromoDetailsPage(testPromo),
                          )),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    MaterialButton(
                      child: SizedBox(
                        child: _buildField(
                            image: zoo[1], title: "Photography/Graphic Design"),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PhotoDetailsPage(testPhoto),
                          )),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    MaterialButton(
                      child: SizedBox(
                        child: _buildField(
                            image: zoo[2], title: "Research/Education"),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResearchDetailsPage(testResearch),
                          )),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    MaterialButton(
                      child: SizedBox(
                        child:
                            _buildField(image: zoo[3], title: "Horticulture"),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                HorticultureDetailsPage(testHorticulture),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Gallery\n")),
                  FlatButton(
                      textColor: Colors.red,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VolGallery(),
                          )),
                      child: Text("See All")),
                ],
              ),
              Container(
                height: 160,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: PNetworkImage(
                                'https://www.zoonegaramalaysia.my/images/volunteer/01.jpg',
                                height: 180,
                                fit: BoxFit.cover))),
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
                                  'https://www.zoonegaramalaysia.my/images/volunteer/04.jpg',
                                  fit: BoxFit.cover)),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: PNetworkImage(pashupatinath,
                                  fit: BoxFit.cover)),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: PNetworkImage(
                                  'https://www.zoonegaramalaysia.my/images/volunteer/08.jpg',
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

  Widget _buildField({String image, String title}) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: PNetworkImage(
            image,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(title),
      ],
    );
  }
}
