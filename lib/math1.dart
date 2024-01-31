
import 'dart:core';

import 'package:demo/win.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/level.dart';
import 'package:demo/math.dart';


class math1 extends StatefulWidget {
int ?ind;
bool ?status;
math1([this.ind,this.status]);

  @override
  State<math1> createState() => _math1State();
}

class _math1State extends State<math1> {

  int level_no=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 if(widget.ind!=null)
   {
      if(widget.status==true)
        {
          level_no=widget.ind!;
        }else
          {
            level_no=math.prefs!.getInt("level_no") ?? 0 ;
          }
   }else
     {
       level_no=math.prefs!.getInt("level_no") ?? 0 ;
     }
  }


  String str = "";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("myasset/math/gameplaybackground.jpg"),
              ),
            ),
            child: Column(children: [
              Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                            // onTap: () {
                            //   String temp_status=math.prefs!.getString("level_status$level_no") ?? "";
                            //   String str=math.prefs!.getString("skipTime") ?? "";
                            //   if(str=="") {
                            //     DateTime dt=DateTime.now();
                            //     math.prefs!.setString("skipTime", dt.toString());
                            //           if(widget.status==true) {
                            //               if(temp_status!="yes") {
                            //                 math.prefs!.setString("level_status$level_no", "no");
                            //                 level_no++;
                            //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //                   return math1(level_no,true);
                            //                 },));
                            //               }else {
                            //                 level_no++;
                            //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //                   return math1(level_no,true);
                            //                 },));
                            //               }
                            //             }else{
                            //             math.prefs!.setString("level_status$level_no", "no");
                            //             level_no++;
                            //             math.prefs!.setInt("level_no", level_no);
                            //             Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //               return math1();
                            //             },));
                            //           }
                            //     }else
                            //       {
                            //         DateTime t2=DateTime.parse(str);
                            //         DateTime dt=DateTime.now();
                            //         var diff =dt.difference(t2).inSeconds;
                            //         if(diff>=10){
                            //           showDialog(context: context, builder: (context) {
                            //             return AlertDialog(title: Text("plz skip after 10 second"),actions: [
                            //               TextButton(onPressed: () {
                            //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //                   return math1(level_no,widget.status);
                            //                 },));
                            //               }, child: Text("OK"))
                            //             ],);
                            //           },);
                            //         }else
                            //         {
                            //           math.prefs!.setString("skipTime", dt.toString());
                            //           if(widget.status==true){
                            //             if(temp_status!="yes"){
                            //               math.prefs!.setString("level_status$level_no", "no");
                            //               level_no++;
                            //               Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //                 return math1(level_no,true);
                            //               },));
                            //             }else
                            //             {
                            //               level_no++;
                            //               Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //                 return math1(level_no,true);
                            //               },));
                            //             }
                            //           }else
                            //           {
                            //             math.prefs!.setString("level_status$level_no", "no");
                            //             level_no++;
                            //             math.prefs!.setInt("level_no", level_no);
                            //             Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //               return math1();
                            //             },));
                            //           }
                            //         }
                            //       }
                            //   setState(() {
                            //
                            //   });
                            //
                            // },
                            onTap: () {
                              String temp_status=math.prefs!.getString("level_status$level_no") ?? "";
                              String str=math.prefs!.getString("skipTime") ?? "";
                              if(str=="") {
                                print("GM");
                                DateTime dt=DateTime.now();
                                math.prefs!.setString("skipTime", dt.toString());
                                if(widget.status==true){
                                  if(temp_status!="yes"){
                                    math.prefs!.setString("level_status$level_no", "no");
                                    level_no++;
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return math1(level_no,true);
                                    },));
                                  }else {
                                    level_no++;
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return math1(level_no,true);
                                    },));
                                  }
                                }else {
                                  math.prefs!.setString("level_status$level_no", "no");
                                  level_no++;
                                  math.prefs!.setInt("level_no", level_no);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return math1();
                                  },));
                                }
                              }else
                              {
                                DateTime t2=DateTime.parse(str);
                                DateTime dt=DateTime.now();
                                var diff = dt.difference(t2).inSeconds;
                                print("Test:$diff");
                                if(diff<=10){
                                  showDialog(context: context, builder: (context) {
                                    return AlertDialog(title: Text("plz skip after 10 second"),actions: [
                                      TextButton(onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return math1(level_no,widget.status);
                                        },));
                                      }, child: Text("OK"))
                                    ],);
                                  },);
                                }else
                                {
                                  math.prefs!.setString("skipTime", dt.toString());
                                  if(widget.status==true){
                                    if(temp_status!="yes"){
                                      math.prefs!.setString("level_status$level_no", "no");
                                      level_no++;
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return math1(level_no,true);
                                      },));
                                    }else
                                    {
                                      level_no++;
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return math1(level_no,true);
                                      },));
                                    }
                                  }else
                                  {
                                    math.prefs!.setString("level_status$level_no", "no");
                                    level_no++;
                                    math.prefs!.setInt("level_no", level_no);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return math1();
                                    },));
                                  }
                                }
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.topLeft,
                              child: Image(
                                  image: AssetImage("myasset/math/skip.png")),
                            ),
                          )),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Puzzle ${level_no + 1}",
                                style:
                                TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "myasset/math/level_board.png"),
                              ),
                            ),
                            width: double.infinity,
                            height: double.infinity,
                          )),
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                barrierColor: Colors.transparent,
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("${level.hint[level_no]}"),
                                    actions: [
                                      Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Ok"))
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.topRight,
                              child: Image(
                                  image: AssetImage("myasset/math/hint.png")),
                            ),
                          )),
                    ],
                  )),
              Expanded(
                flex: 7,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(
                          "myasset/math/${level.puzzel_level[level_no]}"))),
                ),
              ),
              Expanded(flex: 3, child: Text("")),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                  child: Column(children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child:
                                Text("${str}", style: TextStyle(fontSize: 20)),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                                width: double.infinity,
                                height: double.infinity,
                                margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str.substring(0, str.length - 1);
                                  setState(() {});
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                                  child: Image(
                                      image: AssetImage(
                                          "myasset/math/delete.png")),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (level.puzzel_ans[level_no] == str) {
                                    math.prefs!.setString("level_status$level_no", "yes");
                                    int temp=math.prefs!.getInt("level_no") ?? 0 ;
                                    if(level_no>=temp){
                                      level_no++;
                                      math.prefs!.setInt("level_no", level_no);
                                    }else
                                    {
                                      level_no++;
                                    }
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return win(level_no,widget.status);
                                    },));
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                                  child: Text("Submit",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "1";
                                  setState(() {});
                                },
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("1",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "2";
                                  setState(() {});
                                },
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("2",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "3";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("3",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "4";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("4",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "5";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("5",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "6";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("6",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "7";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("7",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "8";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("8",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "9";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("9",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              )),
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  str = str + "0";
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(
                                          color: Colors.white, width: 2)),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.only(
                                      right: 5, bottom: 10, top: 10),
                                  child: Text("0",
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ]),
          ),
        ), onWillPop: () async {
          showDialog(barrierColor: Colors.transparent,barrierDismissible: false,context: context, builder: (context) {
            return AlertDialog(title: Text("are you sure exit"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return math();
                  },));
                }, child: Text("YES")),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("No"))
              ],
            );
          },);
          return true;
        },));
  }
}
