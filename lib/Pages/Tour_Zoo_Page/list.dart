import 'package:flutter/material.dart';

class PlaceList1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Malaysia Zoo's List "),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 2,
      ),
      body: Lists(),
    );
  }
}

class ZooItem {
  final String zoo;
  final String location;

  ZooItem(this.zoo, this.location);
}

class Lists extends StatelessWidget {
  final List<ZooItem> zoos = [
    ZooItem("Kuala Lumpur Bird Park", " Kuala Lumpur"),
    ZooItem("Bukit Gambang Safari Park", " Gambang, Kuantan, Pahang"),
    ZooItem("Zoo Melaka", " Ayer Keroh, Malacca"),
    ZooItem(
        "National Zoo of Malaysia (Zoo Negara)", " Ulu Klang, Kuala Lumpur"),
    ZooItem("Zoo Taiping", " Taiping, Perak"),
    ZooItem("Lok Kawi Wildlife Park", " Lok Kawi, Sabah"),
    ZooItem("Zoo Johor", " Johor Bahru, Johor"),
    ZooItem("Zoo Terengganu", " Kemaman, Terengganu"),
    ZooItem("Sunway Lagoon Wildlife Park", " Subang Jaya, Selangor"),
    ZooItem("Sunway Petting Zoo", " Subang Jaya, Selangor"),
    ZooItem("Lost World Petting Zoo", " Ipoh, Perak"),
    ZooItem("Kuala Krai mini zoo", " Kuala Krai, Kelantan"),
    ZooItem("Butterfly & Reptiles Sanctuary", " Malacca"),
    ZooItem("Kuala Lumpur Butterfly Park", " Kuala Lumpur"),
    ZooItem("entopia by Penang Butterfly Farm", " Teluk Bahang, Penang"),
    ZooItem("Bukit Jambul Orchid,\n Hibiscus and Reptile Farm", " Penang"),
    ZooItem("Taman Teruntum Mini Zoo", " Taman Teruntum, Pahang"),
    ZooItem("Kuala Lumpur Deer Park", " Kuala Lumpur"),
    ZooItem("Danga Bay Mini Zoo", " Danga Bay, Johor"),
    ZooItem("Afamosa Animal World Safari", " Alor Gajah, Malacca"),
    ZooItem("Langkawi Wildlife Park", " Langkawi, Kedah"),
    ZooItem("Snake and Reptile Farm", " Perlis"),
    ZooItem("Langkawi Crocodile Farm", " Langkawi, Kedah"),
    ZooItem("Ayer Keroh Crocodile Farm", " Ayer Keroh, Malacca"),
    ZooItem("Jong Crocodile Farm", " Kuching, Sarawak"),
    ZooItem("Sandakan Crocodile Farm", " Sandakan, Sabah"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Coming Soon",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.0),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20),
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          child: ListView.builder(
            padding: EdgeInsets.all(6),
            itemCount: zoos.length,
            itemBuilder: (BuildContext context, int index) {
              ZooItem item = zoos[index];
              return Card(
                elevation: 3,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.zoo,
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w700,
                                fontSize: 17),
                          ),
                          Text(
                            item.location,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
