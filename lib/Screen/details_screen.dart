import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final String url;

  DetailsScreen(this.url);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:IconThemeData(color: Colors.black) ,
        title: Text('Details',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: ((WebViewController webView) {
            _controller.complete(webView);
          }),
        ),
      ),
    );
  }
}
