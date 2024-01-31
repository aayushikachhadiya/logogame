import 'package:demo/login2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: login1(),
    debugShowCheckedModeBanner: false,
  ));
}

class login1 extends StatefulWidget {
  const login1({super.key});
  static SharedPreferences ?prefs;

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  List<String> l = [];
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
  async {
    login1.prefs = await SharedPreferences.getInstance();
    level=login1.prefs!.getInt("level_no")??0;
    // for(int i=0;i<=level;i++)
    // {
    //   l[i]=login1.prefs!.getString("User$i")??"";
    //   print("user=$user");
    //   print("pass=$pass");
    // }
    user=login1.prefs!.getString("User")??"";
    pass=login1.prefs!.getString("Pass")??"";
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController t1=TextEditingController();
    TextEditingController t2=TextEditingController();
    return Scaffold(
        appBar: AppBar(title: Text("login System")),
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
              child: Text("Login Account",
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
           Container(margin: EdgeInsets.all(20),
             child:  TextField(
               controller: t1,
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
            controller: t2,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              hintText: "Password",
              labelText: "Password",
            ),
          ),),
           Row(mainAxisAlignment: MainAxisAlignment.center,children: [
             InkWell(
               onTap: () {
                 String h1=t1.text;
                 String h2=t2.text;
                 print(level);
                 if(h1==user && h2==pass)
                    {
                      print("valid uesrname and passwords");
                      t1.text="";
                      t2.text="";
                    }else
                      {
                        print("not valid username and passwords");
                      }
               },
               child: Container(color: Colors.black,
                 alignment: Alignment.center,
                 margin: EdgeInsets.all(10),
                 height: 40,
                 width: 100,
                 child: Text("Login ",style: TextStyle(fontSize: 20,color: Colors.white)),
               ),
             ),
             InkWell(
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return login2();
                 },));
               },
               child: Container(color: Colors.black,
                 alignment: Alignment.center,
                 margin: EdgeInsets.all(10),
                 height: 40,
                 width: 100,
                 child: Text("Create acc",style: TextStyle(fontSize: 20,color: Colors.white)),
               ),
             )
           ],)
          ]),
        ));
  }
}
