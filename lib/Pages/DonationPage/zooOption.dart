import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ZooOptions extends StatefulWidget {
  @override
  _ZooOptionsState createState() => _ZooOptionsState();
}

class _ZooOptionsState extends State<ZooOptions> {
  bool selectedZoo = false;
  bool selectedNegara = false;
  bool selectedTaiping = false;
  bool selectedMelaka = false;

  String returnZoo() {
    if (this.selectedNegara) {
      return 'Zoo Negara';
    } else if (this.selectedMelaka) {
      return 'Zoo Melaka';
    } else if (this.selectedTaiping) {
      return 'Zoo Taiping';
    }
  }

  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height * 0.9;
    double boxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoo Options'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                selectedZoo = true;

                selectedNegara = true;
                selectedTaiping = false;
                selectedMelaka = false;
              });
            },
            child: Card(
              shape: selectedNegara
                  ? new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.blue, width: 2.0),
                    )
                  : new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.white, width: 2.0),
                    ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                ),
                width: boxWidth,
                height: boxHeight,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: boxWidth,
                      height: boxHeight * (1 / 3),
                      padding: EdgeInsets.all(10),
                      child: Carousel(
                        images: [
                          Image.asset('assets/Zoo/Negara/1.jpg'),
                          Image.asset('assets/Zoo/Negara/2.jpg'),
                          Image.asset('assets/Zoo/Negara/3.jpg'),
                          Image.asset('assets/Zoo/Negara/4.jpg'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Information",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.black38,
                                    ),
                                    Container(
                                        child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("Name"),
                                          subtitle: Text("Zoo Negara"),
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 10),
                                          leading: Icon(Icons.my_location),
                                          title: Text("Location"),
                                          subtitle: Text(
                                              "Zoo Negara, Hulu Kelang, 68000 Ampang,Selangor\n Darul Ehsan, Malaysia"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle: Text(
                                              "customerservice@zoonegaramalaysia.my"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("+603-4108 3422/7/8"),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                selectedZoo = true;

                selectedNegara = false;
                selectedTaiping = true;
                selectedMelaka = false;
              });
            },
            child: Card(
              shape: selectedTaiping
                  ? new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.blue, width: 2.0),
                    )
                  : new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.white, width: 2.0),
                    ),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  width: boxWidth,
                  height: boxHeight,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: boxWidth,
                        height: boxHeight * (1 / 3),
                        padding: EdgeInsets.all(10),
                        child: Carousel(
                          images: [
                            Image.asset('assets/Zoo/Taiping/1.jpg'),
                            Image.asset('assets/Zoo/Taiping/2.jpeg'),
                            Image.asset('assets/Zoo/Taiping/3.jpg')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Card(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Information",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                          child: Column(
                                        children: <Widget>[
                                          ListTile(
                                            leading: Icon(Icons.person),
                                            title: Text("Name"),
                                            subtitle: Text(
                                                "Zoo Taiping & Night Safari"),
                                          ),
                                          ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4),
                                            leading: Icon(Icons.my_location),
                                            title: Text("Location"),
                                            subtitle: Text(
                                                "Zoo Taiping, Jalan Taman Tasik Taiping,\n34000 Taiping, Perak Darul Ridzuan, Malaysia."),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.email),
                                            title: Text("Email"),
                                            subtitle: Text(
                                                "zootaiping@zootaiping.gov.my"),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.phone),
                                            title: Text("Phone"),
                                            subtitle: Text("605 - 8086577"),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                selectedZoo = true;

                selectedNegara = false;
                selectedTaiping = false;
                selectedMelaka = true;
              });
            },
            child: Card(
              shape: selectedMelaka
                  ? new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.blue, width: 2.0),
                    )
                  : new RoundedRectangleBorder(
                      side: new BorderSide(color: Colors.white, width: 2.0),
                    ),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  width: boxWidth,
                  height: boxHeight,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: boxWidth,
                        height: boxHeight * (1 / 3),
                        padding: EdgeInsets.all(10),
                        child: Carousel(
                          images: [
                            Image.asset('assets/Zoo/Melaka/1.jpg'),
                            Image.asset('assets/Zoo/Melaka/2.jpg'),
                            Image.asset('assets/Zoo/Melaka/3.jpg')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Card(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Information",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black38,
                                      ),
                                      Container(
                                          child: Column(
                                        children: <Widget>[
                                          ListTile(
                                            leading: Icon(Icons.person),
                                            title: Text("Name"),
                                            subtitle: Text(
                                                "Zoo Melaka & Night Safari"),
                                          ),
                                          ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 4),
                                            leading: Icon(Icons.my_location),
                                            title: Text("Location"),
                                            subtitle: Text(
                                                "Zoo Melaka, Lebuh Ayer Keroh, Hang Tuah Jaya, 75450 Ayer Keroh, Melaka"),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.email),
                                            title: Text("Email"),
                                            subtitle:
                                                Text("info@melakazoo.com"),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.phone),
                                            title: Text("Phone"),
                                            subtitle: Text("+06-2323-900"),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(5),
          child: RaisedButton(
            color: (selectedZoo) ? Colors.red : Colors.grey,
            onPressed: () => {
              if (selectedZoo)
                {
                  Navigator.pop(context, this.returnZoo()),
                }
            },
            child: Text(
              'CONFIRM',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
