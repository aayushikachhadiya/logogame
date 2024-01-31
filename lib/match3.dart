import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'match1.dart';
import 'match2.dart';

void main() {
  runApp(MaterialApp(
    home: match3(),
  ));
}

class match3 extends StatefulWidget {
  List? l;
  int? ind;
  String? page;
  match3([this.l, this.ind, this.page]);

  @override
  State<match3> createState() => _match3State();
}
class _match3State extends State<match3> {
  List pic = [];
  List pic1 = [];
  List<bool> a = [];
  bool start = true;
  int second = 0;
  int stop = 6;
  int cur_level = 0;
  int normal = 0;
  int j = 5, i = 0;
  int x = 1, pos1 = 1, pos2 = 2;
  bool alert=false;
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('myasset/match/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      pic = imagePaths;
      pic.shuffle();
      for (int i = 0; i < 6; i++) {
        pic1.add(pic[i]);
        pic1.add(pic[i]);
      }
      pic1.shuffle();
      print(pic);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration.zero, () {
      showDialog(context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("hello"),
              actions: [
                TextButton(onPressed: () {
                  alert=true;
                  get();
                  Navigator.pop(context);
                  setState(() {
                  });
                }, child: Text("Ok"))
              ],
            );
          });
    });
    a = List.filled(12, true);
    _initImages();
    if (widget.page == "No time limit") {
      cur_level = match1.prefs!.getInt("cur") ?? 0;
    } else {
      normal = match1.prefs!.getInt("time") ?? 0;
    }
    print("cur_level1=$cur_level");
    print("CurClick:${widget.ind}");
    print(widget.page);
  }

  get() async {
       for (int i = 5; i >= 0; i--) {
         print(i);
         await Future.delayed(Duration(seconds: 1));
         j = i;
         if (i == 0) a = List.filled(12, false);
         setState(() {});
       }

    if (widget.page == "No time limit") {
      for (int i = 0; i < 1000; i++) {
          await Future.delayed(Duration(seconds: 1));
          if(start==true)j=i;
          setState(() {});
      }
    } else if (widget.page == "Normal") {
      for (int i = 0; i <= stop; i++) {
        if (start == true) {
          await Future.delayed(Duration(seconds: 1));
          j = i;
          if (j == stop) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Container(height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: Colors.teal,
                    child: Text("TIME OUT", style:TextStyle(fontSize: 25)),),
                  content: Text("\tTRY AGAIN?"),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return match2(widget.page);
                      },));
                    }, child: Text("Cancle")),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return match3();
                      },));
                    }, child: Text("OK")),
                  ],
                );
              },
            );
          }
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (widget.page=="Normal")?Text("${j}/${stop}"):Text("${j}"),
        backgroundColor: Colors.teal,
      ),
      body: Column(children: [
        (alert==true)? Countdown(seconds: 5, build: (p0, p1) {
          return  SliderTheme(
            child: Slider(
              value: p1,
              max: 5,
              min: 0,
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              onChanged: (double value) {},
            ),
            data: SliderTheme.of(context).copyWith(
                trackHeight: 15,
                thumbColor: Colors.transparent,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0)),
          );
        },):Text(""),

        Expanded(child:   GridView.builder(
          itemCount: pic1.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (!a[index] && x == 1) {
                  a[index] = true;
                  x = 2;
                  pos1 = index;
                }
                if (!a[index] && x == 2) {
                  a[index] = true;
                  x = 3;
                  pos2 = index;
                  if (pic1[pos1] == pic1[pos2]) {
                    print("Image is match");
                    x=1;
                    stop = stop + 5;
                  } else {
                    Future.delayed(Duration(microseconds: 250)).then((value) {
                      x=1;
                      a[pos1] = false;
                      a[pos2] = false;
                      setState(() {});
                    });
                  }
                }
                if (a[0] == true &&
                    a[1] == true &&
                    a[2] == true &&
                    a[3] == true &&
                    a[4] == true &&
                    a[5] == true &&
                    a[6] == true &&
                    a[7] == true &&
                    a[8] == true &&
                    a[9] == true &&
                    a[10] == true &&
                    a[11] == true) {
                  start = false;
                  if (widget.page == "No time limit") {
                    if (widget.ind! >= cur_level) {
                      match1.prefs!.setInt("play$cur_level", j);
                      cur_level++;
                      match1.prefs!.setInt("cur", cur_level);
                    } else {
                      int temp = match1.prefs!.getInt("play${widget.ind}") ?? 0;
                      if (temp >= j) {
                        match1.prefs!.setInt("play${widget.ind}", j);
                      }
                    }
                  } else {
                    if (widget.ind! >= normal) {
                      match1.prefs!.setInt("start$normal", j);
                      normal++;
                      match1.prefs!.setInt("time", normal);
                    } else {
                      int temp1 = match1.prefs!.getInt("start${widget.ind}") ?? 0;
                      if (temp1 >= j) {
                        match1.prefs!.setInt("start${widget.ind}", j);
                      }
                    }
                  }
                  print("cur=$cur_level");
                  showDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.teal,
                            child: Text(
                              "NEW RECORDS",
                              style: TextStyle(color: Colors.white),
                            )),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return match2(widget.page);
                                  },
                                ));
                                setState(() {
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.teal,
                                child: Text("OK",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                height: 50,
                                width: 300,
                              ))
                        ],
                        content: Text("CONGRATULATIONS"),
                      );
                    },
                  );
                }
                setState(() {});
              },
              child: Visibility(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset("${pic1[index]}"),
                ),
                visible: a[index],
                replacement: Container(
                  width: 100,
                  height: 100,
                  color: Colors.teal,
                ),
              ),
            );
          },
        ),)
      ],)
    );
  }
}
