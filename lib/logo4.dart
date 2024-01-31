import 'dart:math';

import 'package:demo/data_image.dart';
import 'package:demo/level.dart';
import 'package:demo/logo3.dart';
import 'package:flutter/material.dart';

import 'logo1.dart';
import 'logo2.dart';

class logo4 extends StatefulWidget {
  int ind;
  List im;
  logo4(this.ind, this.im);

  @override
  State<logo4> createState() => _logo4State();
}

class _logo4State extends State<logo4> {
  PageController? controller;
  int hint =1;
  int hint1 =1;
  int hint2 =1;
  int c = 1;
  int p=0;
  List ans = [
    "usa",
    "mail",
    "cnet",
    "apple",
    "media",
    "intel",
    "honda",
    "mager",
    "mtv",
    "pepsi",
    "loreal",
    "volvo",
    "bentley",
    "atp",
    "canal",
    "tnt",
    "ubs",
    "z",
    "lila",
    "giant"
  ];
  List temp = [];
  List item = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];
  int level_no = 0;
  List user_ans = [];
  List option = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level_no = widget.ind;
    get();
    controller = PageController(initialPage: level_no);
  }
  List l = [];
  List temp1 = [];
  get() {
    p=logo1.prefs!.getInt("points")??0;
    user_ans = List.filled(ans[level_no].toString().length, "");
    item.shuffle();
    option = List.filled(14, "");
    temp = List.filled(user_ans.length, "");
    temp1 = List.filled(user_ans.length, false);
    for (int i = 0; i < user_ans.length; i++) {
      option[i] = ans[level_no][i];
    }
    for (int i = user_ans.length; i < 14; i++) {
      option[i] = item[i];
    }
    option.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text("${level_no + 1}/${widget.im.length}"),
            centerTitle: true,
            backgroundColor: Colors.indigo,
          ),
          body: PageView.builder(
            controller: controller,
            itemCount: widget.im.length,
            onPageChanged: (value) {
              hint2=1;
              hint1=1;
              hint=1;
              level_no = value;
              controller!.jumpToPage(level_no);
              get();
              print("Level:$level_no");
              setState(() {});
            },
            itemBuilder: (context, index) {
              String test = logo1.prefs!.getString("Wins$index") ?? "";
              return (test == "pass")
                  ? Column(
                      children: [
                        Expanded(
                            child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.asset(
                              "myasset/logo/${widget.im[level_no]}"),
                        )),
                        Expanded(
                            child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "myasset/logo/n_hints_green.png"))),
                          child: Expanded(
                              child: Column(children: [
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(top: 80),
                              child: Text("Perfect",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white)),
                            )),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                level_no++;
                                controller!.jumpToPage(level_no);
                                get();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    bottom: 80, left: 100, right: 100),
                                color: Colors.black,
                                child: Text("Next",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ))
                          ])),
                        ))
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(child: Text("")),
                              IconButton(
                                  onPressed: () {
                                    level_no--;
                                    controller!.jumpToPage(level_no);
                                    get();
                                    setState(() {});
                                  },
                                  icon: Image.asset(
                                      "myasset/logo/game_arrow_left.png")),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Image.asset(
                                        "myasset/logo/${widget.im[level_no]}"),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    level_no++;
                                    controller!.jumpToPage(level_no);
                                    get();
                                    setState(() {});
                                  },
                                  icon: Image.asset(
                                      "myasset/logo/game_arrow_right.png")),
                              Expanded(child: Text(""))
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              children: List.generate(
                                  user_ans.length,
                                  (index) => InkWell(
                                        onTap: () {
                                          if (temp1[index] == false) {
                                            if (user_ans[index] != "")
                                              option[temp[index]] =
                                                  user_ans[index];
                                            user_ans[index] = "";
                                          }
                                          win();
                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 50,
                                          alignment: Alignment.center,
                                          height: 50,
                                          color: Colors.black38,
                                          margin: EdgeInsets.all(3),
                                          child: Text("${user_ans[index]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30)),
                                        ),
                                      ))),
                        )),
                        Expanded(
                            child: Container(
                          child: Row(children: [
                            Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:  Container(
                                              height: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "myasset/logo/n_pop_hints_red_clicked_c.png"))),
                                              child: Text(
                                                "point=${logo1.prefs!.getInt("points")??0}",
                                                style: TextStyle(
                                                    fontSize: 20, color: Colors.white),
                                              )),
                                          actions: [
                                            InkWell(
                                              onTap: () {
                                                if(p==0)
                                                  {
                                                    showDialog(context: context, builder: (context) {
                                                      return AlertDialog(
                                                          title: Text("you dont have point so collect a point "),
                                                        actions: [
                                                          TextButton(onPressed: () {
                                                            Navigator.pop(context);
                                                          }, child: Text("Ok"))
                                                        ],
                                                      );
                                                    },);
                                                    setState(() {
                                                    });
                                                  }else
                                                    {
                                                      hint=2;
                                                      if(p>=10)
                                                      {
                                                        p=p-10;
                                                        logo1.prefs!.setInt("points", p);
                                                      }
                                                      int r = Random().nextInt(user_ans.length);
                                                      print(r);
                                                      List abc = [];
                                                      abc = List.filled(user_ans.length, "");
                                                      for (int i = 0;i < ans[level_no].toString().length; i++) {
                                                        abc[i] = ans[level_no].toString()[i];
                                                      }
                                                      user_ans[r] = abc[r];
                                                      for (int i = 0; i < option.length; i++) {
                                                        if (abc[r] == option[i]) {
                                                          temp[r] = i;
                                                          temp1[r] = true;
                                                          option[i] = "";
                                                          break;
                                                        }
                                                      }
                                                      Navigator.pop(context);
                                                    }

                                                setState(() {

                                                });
                                              },
                                              child: Container(
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "myasset/logo/n_hints_green.png"))),
                                                  child: Text(
                                                    "1 char hint",
                                                    style: TextStyle(
                                                        fontSize: 20, color: Colors.white),
                                                  )),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if(p==0 || p==10)
                                                  {
                                                    showDialog(context: context, builder: (context) {
                                                      return AlertDialog(
                                                        title: Text("you dont have point so collect a point "),
                                                        actions: [
                                                          TextButton(onPressed: () {
                                                            Navigator.pop(context);
                                                          }, child: Text("Ok"))
                                                        ],
                                                      );
                                                    },);
                                                  }else
                                                    {
                                                      hint1=2;
                                                      if(p>=20)
                                                      {
                                                        p=p-20;
                                                        logo1.prefs!.setInt("points", p);
                                                      }
                                                      int r = Random().nextInt(user_ans.length);
                                                      int rs = Random().nextInt(user_ans.length);
                                                      print(r);
                                                      List abc = [];
                                                      abc = List.filled(user_ans.length, "");
                                                      for (int i = 0;i < ans[level_no].toString().length; i++) {
                                                        abc[i] = ans[level_no].toString()[i];
                                                      }
                                                      user_ans[r] = abc[r];
                                                      user_ans[rs] = abc[rs];
                                                      for (int i = 0; i < option.length; i++) {
                                                        if (abc[r] == option[i]) {
                                                          temp[r] = i;
                                                          temp[rs] = i;
                                                          temp1[r] = true;
                                                          temp1[rs] = true;
                                                          option[rs] = "";
                                                          option[r] = "";
                                                          break;
                                                        }
                                                      }
                                                      Navigator.pop(context);
                                                    }

                                                setState(() {
                                                });
                                              },
                                              child: Container(
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "myasset/logo/n_pop_hints_red_clicked_c.png"))),
                                                  child: Text(
                                                    "2 char hint",
                                                    style: TextStyle(
                                                        fontSize: 20, color: Colors.white),
                                                  )),
                                            ),
                                           InkWell(
                                             onTap: () {
                                               if(p==0 || p==10 || p==20)
                                                 {
                                                   showDialog(context: context, builder: (context) {
                                                     return AlertDialog(
                                                       title: Text("you dont have point so collect a point "),
                                                       actions: [
                                                         TextButton(onPressed: () {
                                                           Navigator.pop(context);
                                                         }, child: Text("Ok"))
                                                       ],
                                                     );
                                                   },);
                                                 }else
                                                   {
                                                     hint2=2;
                                                     if(p>=30)
                                                     {
                                                       p=p-30;
                                                       logo1.prefs!.setInt("points", p);
                                                     }
                                                     for(int i=0;i<option.length;i++)
                                                     {
                                                       option[i]="";
                                                     }
                                                     for (int i = 0; i < user_ans.length; i++) {
                                                       option[i] = ans[level_no][i];
                                                     }
                                                     option.shuffle();
                                                     Navigator.pop(context);
                                                   }
                                               setState(() {

                                               });
                                             },
                                             child: Container(
                                                height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: AssetImage(
                                                              "myasset/logo/n_hints_green.png"))),
                                                  child: Text(
                                                    "extra char remove",
                                                    style: TextStyle(
                                                        fontSize: 20, color: Colors.white),
                                                  )),
                                           ),
                                          ],
                                        );
                                      },
                                    );
                                    print(option);
                                    win();
                                    setState(() {});
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  "myasset/logo/game_button_use_hints_clicked.png"))),
                                      child: Text(
                                        "Use hints",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                )),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                for (int i = 0; i < user_ans.length; i++) {
                                  if (user_ans[i] != "") {
                                    option[temp[i]] = user_ans[i];
                                    user_ans[i] = "";
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "myasset/logo/game_button_clear_clicked.png"))),
                              ),
                            )),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                for (int i = temp.length - 1; i >= 0; i--) {
                                  if (temp[i] != "") {
                                    option[temp[i]] = user_ans[i];
                                    user_ans[i] = "";
                                    temp[i] = "";
                                    break;
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "myasset/logo/game_button_back_clicked.png"))),
                              ),
                            ))
                          ]),
                        )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity
                              ,
                              child: GridView.builder(
                                itemCount: 14,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 7,
                                        mainAxisSpacing: 3,
                                        crossAxisSpacing: 3),
                                itemBuilder: (context, index) {
                                  return (option[index] != "")
                                      ? InkWell(
                                          onTap: () {
                                            for (int i = 0;
                                                i < user_ans.length;
                                                i++) {
                                              if (user_ans[i] == "") {
                                                user_ans[i] = option[index];
                                                temp[i] = index;
                                                option[index] = "";
                                                break;
                                              }
                                            }
                                            win();
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment.center,
                                            color: Colors.black26,
                                            margin: EdgeInsets.all(3),
                                            child: Text("${option[index]}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white)),
                                          ),
                                        )
                                      : Text("");
                                },
                              ),
                            )),
                        Expanded(
                          child: Text(""),
                        ),
                      ],
                    );
            },
          )),
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return logo3(widget.ind);
          },
        ));
        return true;
      },
    );
  }
  win() {
    String t = user_ans.join("");
    if (t == ans[level_no]) {
     if(hint==1 && hint1==1 && hint2==1)
       {
         p=p+30;
         logo1.prefs!.setInt("points", p);
       }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("You are win the game"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    logo1.prefs!.setString("Wins$level_no", "pass");
                    level_no++;
                    get();
                    controller!.jumpToPage(level_no);
                    setState(() {});
                  },
                  child: Text("Next"))
            ],
          );
        },
      );
    }
  }
}
