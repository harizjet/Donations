import 'package:flutter/material.dart';
import '../animal_single_view.dart';
import '../home.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// import 'package:ztour_mobile/Widgets/menubar2.dart';

class ListMammal extends StatefulWidget {
  String animaltype;
  String animaltype2;

  ListMammal(this.animaltype, this.animaltype2, {Key key}) : super(key: key);
  _ListMammal createState() => _ListMammal();
}

class _ListMammal extends State<ListMammal> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  static List<Map> animalListMammal = [];
  static List<Map> duplicates = [];

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  Widget _body = mammalLOADING();

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

    for (int x = 0; x < animalListMammal.length; x++) {
      Image downloadImage =
          new Image.network(_ListMammal.animalListMammal[x]['logoText'].trim());

      final ImageStream stream =
          downloadImage.image.resolve(ImageConfiguration.empty);
      final Completer<void> completer = Completer<void>();
      stream.addListener(ImageStreamListener(
          (ImageInfo info, bool syncCall) => completer.complete()));
      await completer.future;
      print(x);
      // print(animalListMammal.length);
      if (x == animalListMammal.length - 1) {
        if (mounted) {
          setState(() {
            _body = mammalSIAP(context);
          });
        }
      }
    }
  }

  Future readExcel() async {
    ByteData data = await rootBundle.load("assets/Animal_Unique.xlsx");

    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);

    var table = decoder.tables['Animal_Unique'];

    return table;
  }

  //get animal type
  Future animalData(String animaltype, String animaltype2) async {
    animalListMammal = [];
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
        animalListMammal.add(temmap);
      }
    }
    // if (await animalListMammal != null) {
    //   setState(() {
    //     this._body = mammalSIAP();
    //   });
    // }
    setState(() {
      _ListMammal.duplicates = animalListMammal;
    });

    print(animalListMammal.length);
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget mammalSIAP(BuildContext context) {
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
                        onPressed: () => AnimalHomePage(), //DrawerPage(),
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
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
                          controller: editingController,
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
                      image: NetworkImage(
                          _ListMammal.animalListMammal[index]['logoText']),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _ListMammal.animalListMammal[index]['name'],
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

class mammalLOADING extends StatelessWidget {
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
