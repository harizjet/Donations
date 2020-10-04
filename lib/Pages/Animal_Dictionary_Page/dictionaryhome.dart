//import 'dart:js';
import 'mammals/list_mammals.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
//import 'category_animal.dart';
import 'category_animal.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:flutter/services.dart';
import 'output.dart';
//import 'demo.dart';
//import 'list2.dart';
//import 'quiz_options.dart';

class AnimalHomePage extends StatefulWidget {
  static bool found = false;
  static Map<String, String> animals = {};
  static List<String> closestinput = [];

  @override
  _AnimalHomePageState createState() => _AnimalHomePageState();
}

class _AnimalHomePageState extends State<AnimalHomePage> {
  static final String path = "lib/Pages/Animal_Dictionary_Page/home.dart";
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

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
            AnimalHomePage.animals[table.rows[row - 1][col]] =
                table.rows[row][col].toString().replaceAll('|', ',');
            AnimalHomePage.found = true;
          }
        }
        return AnimalHomePage.animals;
      }

      if (table.rows[row][0].toUpperCase().split(
              ' ')[table.rows[row][0].toUpperCase().split(' ').length - 1] ==
          input.toUpperCase().split(' ')[input.split(' ').length - 1]) {
        AnimalHomePage.closestinput.add(table.rows[row][0]);
      }
    }
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
              "Animal Dictionary",
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
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration: BoxDecoration(color: Colors.orange[300]),
                height: 200,
              ),
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SizedBox(height: 10),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      width: 50,
                      height: 100,
                      child: Image.asset('assets/Logodict/1.PNG'),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextField(
                        controller: searchname,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                            hintText: "Search Animal",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 16),
                            prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {},
                                )),
                            suffixIcon: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              color: Colors.orange[300],
                              child: Text('Search'),
                              splashColor: Colors.red,
                              onPressed: () async {
                                AnimalHomePage.found = false;
                                AnimalHomePage.closestinput = [];
                                var temp = await animalData(searchname.text);
                                if (AnimalHomePage.found == true)
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Output(temp),
                                    ),
                                  );
                                if (AnimalHomePage.found == false) {
                                  if (AnimalHomePage.closestinput.length == 0 ||
                                      AnimalHomePage.closestinput[0] ==
                                          'Animal Name ') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            noOutput(AnimalHomePage.found, ''),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => noOutput(
                                            AnimalHomePage.found,
                                            'Perhaps you means ${AnimalHomePage.closestinput.toString()} ?'),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: SizedBox(height: 60),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "Select Category",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(30.0),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0),
                      delegate: SliverChildBuilderDelegate(
                        _buildCategoryItem,
                        childCount: categories.length,
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    CategoryAnimal category = categories[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      // child: new RaisedButton(

      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => category.action)),
      //onPressed: () => {AnimalListMammal()},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
