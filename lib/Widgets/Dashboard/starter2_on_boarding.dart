import 'package:flutter/material.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:ztour_mobile/Widgets/Dashboard/dashboard2.dart';

class LandingOnePage extends StatelessWidget {
  final String bgImage = photographer;
  final String image = ledge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: PNetworkImage(
                bgImage,
                fit: BoxFit.contain,
              )),
          Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(5.0, 5.0),
                            blurRadius: 5.0)
                      ]),
                  margin: EdgeInsets.all(48.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              )),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Interested in Animal\n and Zoo?",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Ztour is an application about animal ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14.0),
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                width: double.infinity,
                child: RaisedButton(
                  padding: const EdgeInsets.all(16.0),
                  textColor: Colors.white,
                  color: Colors.lightGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Dashboard2(),
                      )),
                  child: Text(
                    "Get Started",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
            ],
          )
        ],
      ),
    );
  }
}

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const PNetworkImage(this.image, {Key key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
