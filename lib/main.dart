import 'package:adminlogin/model.dart';
import 'package:adminlogin/second.dart';
import 'package:adminlogin/third.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()
{
  runApp(MaterialApp(home: first(),));
}
class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  @override
  void initState() {
  super.initState();

  g1();
  }

  g1()
  async {
    await Future.delayed(Duration(seconds: 3));
   model.prefs = await SharedPreferences.getInstance();
    if(model.prefs!.containsKey("Login"))
      {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return third();
          },));
      }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return second();
      },));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Container(height: double.infinity,color: Colors.white,child: Container(child: Image.asset('images/lg2.jpg')))),
    );
  }
}
