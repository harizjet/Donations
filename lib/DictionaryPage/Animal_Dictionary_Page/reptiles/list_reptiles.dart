import 'package:flutter/material.dart';
import '../animal_single_view.dart';
// import 'package:ztour_mobile/Widgets/menubar2.dart';
import '../home.dart';

class ListReptiles extends StatefulWidget {
  ListReptiles({Key key}) : super(key: key);

  _ListReptiles createState() => _ListReptiles();
}

class _ListReptiles extends State<ListReptiles> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  final List<Map> animalListReptiles = [
    {
      "name": "Malayan Tiger",
      //  "location": "572 Statan NY, 12483",
      //  "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2019/05/31/17/55/tiger-malayan-tiger-4242695_960_720.jpg"
      //"https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Indochinese Leopard",
      //  "location": "234 Road Kathmandu, Nepal",
      //  "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2014/11/03/17/40/leopard-515509_1280.jpg"
    },
    {
      "name": "Sun Bear",
      //  "location": "572 Statan NY, 12483",
      //  "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2012/03/04/00/38/animal-21993_1280.jpg"
    },
    {
      "name": "Malayan Tapir",
      //  "location": "Kasai Pantan NY, 12483",
      //  "type": "Lower Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/10/12/13/26/animal-1734462_1280.jpg"
    },
    {
      "name": "Fredik Panlon",
      //  "location": "572 Statan NY, 12483",
      //  "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Whitehouse International",
      //  "location": "234 Road Kathmandu, Nepal",
      //  "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Haward Play",
      //  "location": "572 Statan NY, 12483",
      //  "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "Campare Handeson",
      //  "location": "Kasai Pantan NY, 12483",
      //  "type": "Lower Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: animalListReptiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () => AnimalHomePage(),
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Mammals",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search Animal",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AnimalSinglePage()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), //border list
            color: Colors.white,
          ),
          width: double.infinity,
          height: 80,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 2, color: secondary),
                  image: DecorationImage(
                      image:
                          NetworkImage(animalListReptiles[index]['logoText']),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      animalListReptiles[index]['name'],
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        height: 2.5,
                      ),
                    ),
                    //SizedBox(
                    //  height: 6,
                    //  ),
                    /* Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(animalListMammal[index]['location'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ), */
                    //  SizedBox(
                    //   height: 6,
                    //  ),
                    /* Row(
                  children: <Widget>[
                    Icon(
                      Icons.school,
                      color: secondary,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(animalListMammal[index]['type'],
                        style: TextStyle(
                            color: primary, fontSize: 13, letterSpacing: .3)),
                  ],
                ), */
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
