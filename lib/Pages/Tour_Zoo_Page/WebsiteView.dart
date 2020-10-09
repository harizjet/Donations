import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebsiteView extends StatefulWidget {
  final String postUrl;
  final String zooName;
  final String type;
  WebsiteView(this.type, this.zooName, {@required this.postUrl});

  @override
  _WebsiteViewState createState() => _WebsiteViewState();
}

class _WebsiteViewState extends State<WebsiteView> {
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

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
              widget.zooName,
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              " ${widget.type}",
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(
          initialUrl: widget.postUrl,
          initialHeaders: {},
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
            debuggingEnabled: true,
          )),
          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
          },
          onLoadStart: (InAppWebViewController controller, String url) {
            setState(() {
              this.url = url;
            });
          },
          onLoadStop: (InAppWebViewController controller, String url) async {
            setState(() {
              this.url = url;
            });
          },
          onProgressChanged: (InAppWebViewController controller, int progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
        ),
      ),
    );
  }
}
