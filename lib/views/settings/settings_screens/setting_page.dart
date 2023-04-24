import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column
        (
        children: const [
          Text('Setting  Page',style: (TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),)
        ],
      ),

    );
  }
}
