import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVeiwScreen extends StatelessWidget {
   WebVeiwScreen({Key? key, required this.url}) : super(key: key);
final String url;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),);
   //   body: //WebView(initialUrl:url
        
    //  ),
  //  );
  }
}
