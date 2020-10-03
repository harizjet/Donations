import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
//import 'package:ztour_apps1/Pages/Animal_Dictionary_Page/output.dart';

import '../../Pages/Animal_Dictionary_Page/network_image.dart';
import 'output.dart';
//import 'package:ztour_apps1/Pages/Animal_Dictionary_Page/output.dart';
//import 'package:ztour_apps1/Pages/Animal_Dictionary_Page/network_image.dart';

// import 'package:dictionaryusingexceldata/network_image.dart';
// import 'package:dictionaryusingexceldata/no_output.dart';
// import 'package:dictionaryusingexceldata/output.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
// import 'package:ztour_mobile/Pages/Animal_Dictionary/output.dart';
// import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/network_image.dart';

class SearchAnimal extends StatefulWidget {
  SearchAnimal({Key key, this.title}) : super(key: key);
  static bool found = false;
  final String title;
  static Map<String, String> animals = {};
  static List<String> closestinput = [];

  @override
  _SearchAnimalState createState() => _SearchAnimalState();
}

class _SearchAnimalState extends State<SearchAnimal> {
  TextEditingController searchname = TextEditingController();

  var excelfile;

  Future readExcel() async {
    ByteData data = await rootBundle.load("assets/Animal_Information.xlsx");
    var bytes =
        await data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var decoder = await SpreadsheetDecoder.decodeBytes(bytes, update: true);

    var table = await decoder.tables['Animal_Information'];

    return table;
  }

  Future animalData(String input) async {
    var table = await readExcel();
    for (int row = 0; row < table.rows.length; row++) {
      if (table.rows[row][0].toUpperCase() == input.toUpperCase()) {
        for (int col = 0; col < table.maxCols; col++) {
          if (table.rows[row][col] != null) {
            SearchAnimal.animals[table.rows[row - 1][col]] =
                table.rows[row][col].toString().replaceAll('|', ',');
            SearchAnimal.found = true;
          }
        }
        return SearchAnimal.animals;
      }

      if (table.rows[row][0].toUpperCase().split(
              ' ')[table.rows[row][0].toUpperCase().split(' ').length - 1] ==
          input.split(' ')[input.split(' ').length - 1]) {
        SearchAnimal.closestinput.add(table.rows[row][0].toUpperCase());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Animal Dictionary'),
        //   centerTitle: true,
        //   backgroundColor: Colors.green),

        body: Stack(children: <Widget>[
      Container(
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        child: FittedBox(
          child: PNetworkImage(
              'https://cdn.pixabay.com/photo/2016/04/02/10/37/view-1302515_960_720.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 200, left: 2, bottom: 200, right: 2),
        child: Card(
          elevation: 5.0,
          color: Colors.white60,
          child: Container(
            //padding: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(30, 20, 10, 5),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("EXPLORE THE WILDLIFE‎",
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: TextField(
                  controller: searchname,
                  decoration: InputDecoration(
                    hintText: "Search an animal",
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                    prefixIcon: Icon(Icons.message),
                    // labelText: "Search an animal:",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      // splashColor: Colors.blueAccent,
                      onPressed: () async {
                        var temp = await animalData(searchname.text);
                        if (SearchAnimal.found == true)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Output(temp),
                            ),
                          );
                        if (SearchAnimal.found == false)
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => noOutput(SearchAnimal.found,
                                  SearchAnimal.closestinput.toString()),
                            ),
                          );
                      },
                    ),
                  ),
                ),
              ))
        ]),
      )
    ]));
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(width: 1, color: Colors.green),
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(blurRadius: 5, color: Colors.white, offset: Offset(1, 1))
    ],
  );
}
