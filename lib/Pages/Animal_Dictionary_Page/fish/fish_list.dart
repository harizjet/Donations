import 'package:flutter/material.dart';
//import '../animal_single_view.dart';
import '../dictionaryhome.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../output.dart';

// import 'package:ztour_mobile/Widgets/menubar2.dart';

class ListFish extends StatefulWidget {
  static bool found = false;
  static Map<String, String> animals = {};
  static List<String> closestinput = [];

  String animaltype;
  String animaltype2;

  ListFish(this.animaltype, this.animaltype2, {Key key}) : super(key: key);
  _ListFish createState() => _ListFish();
}

class _ListFish extends State<ListFish> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  static List<Map> animalListFish = [];
  static List<Map> duplicates = [];

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  Widget _body = fishLOADING();

  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imageLoad();
  }

  var excelfile;

  void _imageLoad() async {
    String imageName = "";

    await animalData(widget.animaltype, widget.animaltype2);

    // for (int x = 0; x < animalListFish.length; x++) {
    //   Image downloadImage =
    //       new Image.network(_ListFish.animalListFish[x]['logoText'].trim());

    //   final ImageStream stream =
    //       downloadImage.image.resolve(ImageConfiguration.empty);
    //   final Completer<void> completer = Completer<void>();
    //   stream.addListener(ImageStreamListener(
    //       (ImageInfo info, bool syncCall) => completer.complete()));
    //   await completer.future;
    //   print(x);
    //   // print(animalListMammal.length);
    //   if (x == animalListFish.length - 1) {
    //     if (mounted) {
    //       setState(() {
    //         _body = fishSIAP(context);
    //       });
    //     }
    //   }
    // }
    if (mounted) {
      setState(() {
        _body = fishSIAP(context);
      });
    }
  }

  Future readExcel() async {
    ByteData data = await rootBundle.load("assets/Animal_Unique.xlsx");

    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);

    var table = decoder.tables['Animal_Unique'];

    return table;
  }

  Future readExcelpart2() async {
    ByteData data = await rootBundle.load("assets/Animal_Information.xlsx");
    var bytes =
        await data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var decoder = await SpreadsheetDecoder.decodeBytes(bytes, update: true);

    var table = await decoder.tables['Animal_Information'];

    return table;
  }

  Future animalReading(String input) async {
    var table = await readExcelpart2();
    for (int row = 0; row < table.rows.length; row++) {
      if (table.rows[row][0].toUpperCase() == input.toUpperCase()) {
        for (int col = 0; col < table.maxCols; col++) {
          if (table.rows[row][col] != null) {
            ListFish.animals[table.rows[row - 1][col]] =
                table.rows[row][col].toString().replaceAll('|', ',');
            ListFish.found = true;
          }
        }
        return ListFish.animals;
      }

      if (table.rows[row][0].toUpperCase().split(
              ' ')[table.rows[row][0].toUpperCase().split(' ').length - 1] ==
          input.toUpperCase().split(' ')[input.split(' ').length - 1]) {
        ListFish.closestinput.add(table.rows[row][0]);
      }
    }
  }

  //get animal type
  Future animalData(String animaltype, String animaltype2) async {
    animalListFish = [];
    var table = await readExcel();

    //find variable index
    Map<String, int> tempind = {
      'Animal Name': 0,
      'Group': 0,
      'Image Link': 0,
    };

    for (int col = 0; col < table.maxCols; col++) {
      if (table.rows[0][col].trim() == 'Animal Name') {
        tempind['Animal Name'] = col;
      }
      if (table.rows[0][col].trim() == 'Group') {
        tempind['Group'] = col;
      }
      if (table.rows[0][col].trim() == 'Image Link') {
        tempind['Image Link'] = col;
      }
    }

    //find particular animal type
    for (int row = 0; row < table.rows.length; row++) {
      //loops every row for group
      Map<String, String> temmap = {
        'name': '',
        'logoText': '',
      };

      if (table.rows[row][tempind['Group']].toUpperCase() ==
              animaltype.toUpperCase() ||
          table.rows[row][tempind['Group']].toUpperCase() ==
              animaltype2.toUpperCase()) {
        temmap['name'] = table.rows[row][tempind['Animal Name']];
        if (table.rows[row][tempind['Image Link']] == '') {
          temmap['logoText'] =
              'https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png';
        } else {
          temmap['logoText'] = table.rows[row][tempind['Image Link']].trim();
        }
        animalListFish.add(temmap);
      }
    }
    // if (await animalListMammal != null) {
    //   setState(() {
    //     this._body = mammalSIAP();
    //   });
    // }
    setState(() {
      _ListFish.duplicates = animalListFish;
    });

    print(animalListFish.length);
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget fishSIAP(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: animalListFish == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                          itemCount: animalListFish.length,
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
                              onPressed: () =>
                                  Navigator.pop(context), //DrawerPage(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Fish",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            SizedBox(width: 40),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: TextField(
                                controller: editingController,
                                cursorColor: Theme.of(context).primaryColor,
                                style: dropdownMenuItem,
                                decoration: InputDecoration(
                                    hintText: "Search Animal",
                                    hintStyle: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                    prefixIcon: Material(
                                        elevation: 0.0,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        child: IconButton(
                                          icon: Icon(Icons.search),
                                          onPressed: () {
                                            showSearch(
                                                context: context,
                                                delegate:
                                                    Search(animalListFish));
                                          },
                                        )),
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
        onTap: () async {
          ListFish.found = false;
          ListFish.closestinput = [];
          var temp =
              await animalReading(_ListFish.animalListFish[index]['name']);
          if (ListFish.found == true)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Output(temp),
              ),
            );
          if (ListFish.found == false)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    noOutput(ListFish.found, ListFish.closestinput.toString()),
              ),
            );
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
                      image: NetworkImage(
                          _ListFish.animalListFish[index]['logoText']),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _ListFish.animalListFish[index]['name'],
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        height: 2.5,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class fishLOADING extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height) * 0.5,
          child: Column(
            children: <Widget>[
              Text(
                'Please Wait......',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate {
  final List animalListFish;

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  Search(this.animalListFish);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? animalListFish
        : animalListFish
            .where((element) =>
                element['name'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
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
                        image: NetworkImage(suggestionList[index]['logoText']),
                        fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        suggestionList[index]['name'],
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 2.5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
        });
  }
}
