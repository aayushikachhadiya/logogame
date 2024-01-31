
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login1.dart';

void main()
{
  runApp(MaterialApp(home: login2(),debugShowCheckedModeBanner: false,));
}
class login2 extends StatefulWidget {
  const login2({super.key});

  @override
  State<login2> createState() => _login2State();
}

class _login2State extends State<login2> {
  List<Map> l = [];
  String user="";
  String pass="";
  int level=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  {
        user=login1.prefs!.getString("User")??"";
        level=login1.prefs!.getInt("level_no")??0;
        pass=login1.prefs!.getString("Pass")??"";
    print("hello");
    print(login1.prefs!.getString("User")??0);
    print(login1.prefs!.getString("Pass")??0);
  }
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login system")
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 50, top: 20),
        height: 500,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 3, color: Colors.black)),
        child: Column(children: [
          Container(margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Text("Create Account",
                style: TextStyle(color: Colors.black, fontSize: 30)),
          ),
          Container(margin: EdgeInsets.all(20),
            child:  TextField(
              controller: t1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_box),
                hintText: "username",
                labelText: "username",
              ),
            ),
          ),
          Container(margin: EdgeInsets.all(20),
            child:  TextField(
              controller: t2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "E_mail",
                labelText: "E_mail",
              ),
            ),
          ),
          Container(margin: EdgeInsets.all(20),
            child:   TextField(
              controller: t3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                focusColor: Colors.black,
                labelText: "Password",
              ),
            ),),
          InkWell(
            onTap: () {
              String s1=t1.text;
              String s2=t2.text;
              String s3=t3.text;
              // l.add({"key1":t1.text,"key2":t2.text,"key3":t3.text});
              level++;
              login1.prefs!.setInt("level_no", level);
              login1.prefs!.setString("User", t1.text);
              login1.prefs!.setString("Pass", t3.text);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return login1();
              },));
              print(l);
            },
            child: Container(color: Colors.black,
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              height: 40,
              width: 100,
              child: Text("Create acc",style: TextStyle(fontSize: 20,color: Colors.white)),
            ),
          ),
        ]),
      ),

    );
  }
}
