import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../Pages/DonationPage/DonationHistory/donationHistory.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'dart:async';
import 'animalmalaysiagraph.dart';

class animalhomepage extends StatefulWidget {
  @override
  _animalhomepageState createState() => _animalhomepageState();
}

class _animalhomepageState extends State<animalhomepage> {
  List<String> animallistmalaysia = [];
  Widget _body = animalmalaysiaLOADING();

  Future readExcel() async {
    ByteData data = await rootBundle.load("assets/Animal_malaysia.xlsx");

    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    var decoder = SpreadsheetDecoder.decodeBytes(bytes, update: true);

    var table = decoder.tables['Sheet1'];

    return table;
  }

  Future animalReading() async {
    var table = await readExcel();

    for (int row = 4; row < 35; row++) {
      animallistmalaysia.add(table.rows[row][0]);
    }
    // print(animallistmalaysia);
    // print(animallistmalaysia);
    if (mounted) {
      setState(() {
        _body = animalmalaysiaSIAP(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    animalReading();
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  @override
  Widget animalmalaysiaSIAP(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
          title: Text("Animal Graph"),
          centerTitle: true,
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
                    child: SizedBox(height: 25),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "Select Animal",
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
                        childCount: animallistmalaysia.length,
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    String category = animallistmalaysia[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.yellow[300],
      textColor: Colors.black,
      // child: new RaisedButton(

      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => GraphPage(category))),
      // onPressed: () => {AnimalListMammal()},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // if (category.icon != null) Icon(category.icon),
          // if (category.icon != null) SizedBox(height: 5.0),
          Text(
            category,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

class animalmalaysiaLOADING extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text("Animal Graph"),
        centerTitle: true,
      ),
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
