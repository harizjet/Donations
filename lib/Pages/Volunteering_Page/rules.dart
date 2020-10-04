import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Rules extends StatefulWidget {
 // Map animalnames = {};

  

 // Rules(this.animalnames);

  @override
  _OutputState createState() => _OutputState();
}



class _OutputState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Dictionary'),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        //itemCount: widget.animalnames.length,
        itemBuilder: (context, index) {
        //  var column = widget.animalnames.keys.elementAt(index);
        
          return Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                if (index == 0)
                  Align(
                    alignment: Alignment.topCenter,
                    child: RichText(
                      text: TextSpan(
                        text: 'lll',
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
                    color: Colors.brown[100],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: FittedBox(
                      child:
                          Image.network('https://images.pexels.com/photos/1316294/pexels-photo-1316294.jpeg'),
                    ),
                  ),
                  
                if (index == 2)
         
                  Container(
                    decoration: myBoxDecoration(),
                    padding: EdgeInsets.fromLTRB(10, 5, 100, 5),
                    child: Row(
                      children: <Widget>[
                       SizedBox(height: 50),
                        Expanded(
                          child: Text(
                          '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Applicant has to provide a copy of identification card (MyKad/passport) and student ID card along with the application.',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (index == 3)
         
                  Container(
                    decoration: myBoxDecoration(),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                       SizedBox(height: 50),
                        Expanded(
                          child: Text(
                           'Volunteers must wear proper attire while on duty.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: Text(
                        //     'knknk',
                        //     style: TextStyle(
                        //       color: Colors.grey[800],
                        //       fontSize: 15,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  if (index == 4)
         
                  Container(
                    decoration: myBoxDecoration(),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                       SizedBox(height: 50),
                        Expanded(
                          child: Text(
                           '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'knknk',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  if (index == 5)
         
                  Container(
                    decoration: myBoxDecoration(),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                       SizedBox(height: 50),
                        Expanded(
                          child: Text(
                           '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'knknk',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (index == 6)
         
                  Container(
                    decoration: myBoxDecoration(),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                       SizedBox(height: 50),
                        Expanded(
                          child: Text(
                           '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'knknk',
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



BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(
    width: 1,
    color: Colors.brown
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10)
    ),
    boxShadow: [BoxShadow(blurRadius: 5,color: Colors.white,offset: Offset(1,1))],
  );
}


  

