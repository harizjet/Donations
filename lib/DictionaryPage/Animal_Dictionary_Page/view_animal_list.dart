/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/animal_single_view.dart';
import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/output.dart';
import 'package:ztour_mobile/Widgets/menubar2.dart';

//import 'output.dart';
//import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/animal_single_view.dart';
//import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/main.dart';
//import 'package:ztour_mobile/Pages/Animal_Dictionary_Page/output.dart';
//import 'package:ztour_mobile/Widgets/menubar2.dart';

class AnimalListMammal extends StatefulWidget {
  AnimalListMammal({Key key, this.title}) : super(key: key);
  static bool found = false;
  final String title;
  static Map<String, String> animals = {};
  static List<String> closestinput = [];

  _AnimalListDictMammal createState() => _AnimalListDictMammal();
}

class _AnimalListDictMammal extends State<AnimalListMammal> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
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
            AnimalListMammal.animals[table.rows[row - 1][col]] =
                table.rows[row][col].toString().replaceAll('|', ',');
            AnimalListMammal.found = true;
          }
        }
        return AnimalListMammal.animals;
      }

      if (table.rows[row][0].toUpperCase().split(
              ' ')[table.rows[row][0].toUpperCase().split(' ').length - 1] ==
          input.split(' ')[input.split(' ').length - 1]) {
        AnimalListMammal.closestinput.add(table.rows[row][0].toUpperCase());
      }
    }
  }
 
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  final List<Map> animalListMammal = [
    {
      "name": "Tiger",
      //  "location": "572 Statan NY, 12483",
      //  "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/11/06/09/53/animal-2923186_1280.jpg"
      //"https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Xaviers International",
      //  "location": "234 Road Kathmandu, Nepal",
      //  "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Kinder Garden",
      //  "location": "572 Statan NY, 12483",
      //  "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "WilingTon Cambridge",
      //  "location": "Kasai Pantan NY, 12483",
      //  "type": "Lower Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
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
      backgroundColor: Colors.transparent,
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
                    itemCount: animalListMammal.length,
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
                        onPressed: () => DrawerPage(),
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
                          controller: searchname,
                         // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search Animal",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              suffixIcon: Material( //material
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                    
                              //  child: Icon(Icons.search)
                                child: RaisedButton (child:Icon(Icons.search),
                                onPressed: () async {
                                  var temp = await animalData(searchname.text);
                                  if (AnimalListMammal.found == true)
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Output(temp),
                                      ),
                                    );
                               //  )
                                //    );
                                   // )
                                      
                                  if (AnimalListMammal.found == false)
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => noOutput(
                                            AnimalListMammal.found, AnimalListMammal.closestinput.toString()),
                                      ),
                                    );
                                   // ),
                                },
                                // ),
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)
                                 // ),
                               ),
                           ),
                          //,
                          ),
                        ),
                    //  ),
                   // ),
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
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: Colors.transparent),
                  image: DecorationImage(
                      image: NetworkImage(animalListMammal[index]['logoText']),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      animalListMammal[index]['name'],
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
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
        ),
        );
        //);
  }
}*/
