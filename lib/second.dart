import 'package:adminlogin/model.dart';
import 'package:adminlogin/third.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  bool pass=false;


  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  password()
  {
    setState(() {
      pass = !pass;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Login"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black,
              ),
              Container(
                width: double.infinity,
                child: Image.asset('images/lg.jpg'),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: t1,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: "User-id",
                    hintText: "User-id",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextFormField(
                  controller: t2,
                  obscureText: pass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    suffixIcon: IconButton(onPressed: () {
                      password();
                    },icon: Icon(pass ? Icons.visibility_off_outlined : Icons.visibility)),
                    labelText: "Password",
                    hintText: "Password",
                  ),
                ),
              ),
              ElevatedButton(onPressed: () async {

                if(t1.text.trim() == "admin" && t2.text.trim() == "admin")
                {
                  model.prefs = await SharedPreferences.getInstance();
                  await model.prefs!.setString('Login', 'yes');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return third();
                  },));
                }else{

                }
              }, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
