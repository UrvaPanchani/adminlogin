import 'package:adminlogin/model.dart';
import 'package:adminlogin/second.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page"),),
      body: Column(
        children: [
          IconButton(alignment: Alignment.center,onPressed: () async {
            model.prefs = await SharedPreferences.getInstance();
            model.prefs!.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return second();
            },));
          }, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }
}
