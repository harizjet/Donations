import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../helper/widgets.dart';

import '../helper/news.dart';

class AnimalNewsPage extends StatefulWidget {
  @override
  _AnimalNewsPageState createState() => _AnimalNewsPageState();
}

class _AnimalNewsPageState extends State<AnimalNewsPage> {
  bool _loading;
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Animal ",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(
                  color: Colors.yellowAccent, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.share,
              ))
        ],
      ),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
