import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Output extends StatefulWidget {
  Map animalnames = {};

  

  Output(this.animalnames);

  @override
  _OutputState createState() => _OutputState();
}



class _OutputState extends State<Output> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Dictionary'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body:
      //Stack(
      //    children: <Widget>[
      //       ClipPath(
      //         clipper: WaveClipperTwo(),
      //         child: Container(
      //           decoration: BoxDecoration(color: Colors.orange),
      //           height: 200,
      //         ),
      //       ),
       ListView.builder(
        itemCount: widget.animalnames.length,
        itemBuilder: (context, index) {
          var column = widget.animalnames.keys.elementAt(index);
        
          return Container(
            padding: EdgeInsets.all(15),
            color: Colors.yellow[50],
            child: Column(
              children: <Widget>[
                if (index == 0)
                  Align(
                    alignment: Alignment(0.0,0.0),
                    child: RichText(
                      text: TextSpan(
                        text: widget.animalnames[column].toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                if (index == 1)
                  Container(
                    //color: Colors.brown[100],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 4, color: Colors.orange),
                      image: DecorationImage(
                      image: NetworkImage(
                         '${widget.animalnames[column].trim()}'),
                      fit: BoxFit.fill),
                ),
                    // child: FittedBox(
                    //   child:
                    //       Image.network('${widget.animalnames[column].trim()}'),
                    // ),
                  ),
                  
                if (index != 1 && index != 0)
         
                  Container(
                    decoration: myBoxDecoration(),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                       SizedBox(height: 50),
                      //  Expanded(
                      //     child: ListTile(
                      //     title: Text("$column"),
                      //     trailing: Text(
                      //      "${widget.animalnames[column]}",
                      //       //style: bold,
                      //     ),
                      //   ),
                      //  )
                        Expanded(
                          child: Text(
                            "$column",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.animalnames[column]}",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),    
      
    );
  }
}

class noOutput extends StatelessWidget {
  bool result;
  String suggestion;

  noOutput(this.result, this.suggestion);

  String resultword() {
    return ('Results not found');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Dictionary'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.green[100],
        child: Align(
          alignment: Alignment.topCenter,
          child: ListTile(
            title: RichText(
              text: TextSpan(
                text: resultword(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                text: 'Perhaps you means ${this.suggestion} ?',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border:Border.all(
    width: 1,
    color: Colors.brown
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10)
    ),
    boxShadow: [BoxShadow(blurRadius: 5,color: Colors.white,offset: Offset(1,1))],
  );
}




  

