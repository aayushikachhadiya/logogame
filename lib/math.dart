import 'package:demo/puzzel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'math1.dart';

void main() {
  String t1="2023-08-18 19:15:09.329";
  DateTime dt=DateTime.now();
  print("CurTime:$dt");
  print("PastTime:${t1}");
  DateTime t2=DateTime.parse(t1);

  var diff = dt.difference(t2).inSeconds;
  print("Second:$diff");

  runApp(MaterialApp(
    home: math(),
    debugShowCheckedModeBanner: false,
  ));
}

class math extends StatefulWidget {
  static SharedPreferences ?prefs;

  @override
  State<math> createState() => _mathState();
}

class _mathState extends State<math> {
  List l=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    math.prefs = await SharedPreferences.getInstance();
    int levelno=math.prefs!.getInt("level_no") ?? 0 ;
    for(int i=0;i<levelno;i++)
    {
      l.add(math.prefs!.getString("level_status$i"));
    }
  }
  bool status = false;
  bool status2 = false;
  bool status3 = false;
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("myasset/math/background.jpg"),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Math puzzel",
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "myasset/math/blackboard_main_menu.png"))),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(children: [
                    Expanded(
                        child: InkWell(
                          onTapUp: (details) {
                            status = false;
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return math1(null,false);
                              },
                            ));
                            setState(() {});
                          },
                          onTapDown: (details) {
                            status = true;

                            setState(() {});
                          },
                          onTapCancel: () {
                            status = false;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                top: 70, left: 90, right: 100),
                            child: Text("CONTINUE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30,fontFamily: "two")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: (status == true)
                                  ? Border.all(color: Colors.white)
                                  : null,
                            ),
                          ),
                        )),
                    Expanded(
                      child: InkWell(
                        onTapUp: (details) {
                          status2 = false;
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return puzeel(l);
                          },));
                          setState(() {});
                        },
                        onTapDown: (details) {
                          status2 = true;
                          setState(() {});
                        },
                        onTapCancel: () {
                          status2 = false;
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 100,
                              right: 100,
                              bottom: 40,
                              top: 30),
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text("PUZZEL",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30,fontFamily: "two")),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: (status2 == true)
                                ? Border.all(color: Colors.white)
                                : null,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                          onTapUp: (details) {
                            status3 = false;
                            showDialog(
                              barrierColor: Colors.transparent,
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Benfits of Pro Version",
                                      style: TextStyle(
                                          fontSize: 23,
                                          color: Colors.blue)),
                                  content: Text(
                                    "1. No Ads\n\n2.No Wait time for hint and skip"
                                        " \n\n3.Hint for every level \n\n4.Solution for every level",
                                  ),
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                            },
                                            child: Text("Buy")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("No Thanks")),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                            setState(() {});
                          },
                          onTapDown: (details) {
                            status3 = true;
                            setState(() {});
                          },
                          onTapCancel: () {
                            status3 = false;
                            setState(() {});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 100,
                                right: 100,
                                bottom: 70,
                                top: 0),
                            height: double.infinity,
                            width: double.infinity,
                            child: Text("BUY PRO",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30,fontFamily: "two")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              border: (status3 == true)
                                  ? Border.all(color: Colors.white)
                                  : null,
                            ),
                          ),
                        ))
                  ]),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text("")),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 10, 20),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("myasset/math/shareus.png"))),
                        )),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 10, 20),
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("myasset/math/emailus.png"))),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Text("")),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 40),
                        child: Text("Privacy polishi"),
                        alignment: Alignment.center,
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
