import 'dart:convert';

import 'package:demo/hard1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timer_count_down/timer_count_down.dart';

class hard2 extends StatefulWidget {
// List ?l;
int ?ind;
hard2([this.ind]);
  @override
  State<hard2> createState() => _hard2State();
}

class _hard2State extends State<hard2> {
  List pic=[];
  List pic1=[];
  List<bool> a=[];
  int x=1,pos1=1,pos2=2;
  
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('myasset/match'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      pic= imagePaths;
      pic.shuffle();
      for(int i=0;i<6;i++)
        {
          pic1.add(pic[i]);
          pic1.add(pic[i]);
        }
      pic1.shuffle();
    });
  }
  int j=5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a=List.filled(12, true);
    _initImages();
    new Future.delayed(Duration.zero, () {
      showDialog(context: context,
          builder: (BuildContext context) {

              return AlertDialog(
                title: Text("hello"),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                    alert=true;
                    get();
                  }, child: Text("ok"))
                ],
              );

          });
    });
    setState(() {

    });
 
  }
  int cur_level=0;
  bool start=false;
  bool alert=false;
  get()
  async {
    cur_level=hard.prefs!.getInt("curs")??0;
    for(int i=5;i>=0;i--)
      {
        await Future.delayed(Duration(seconds: 1));
        j=i;
        if(i==0)a=List.filled(12, false);
        setState(() {

        });
      }
    for(int i=0;i<1000;i++)
      {
        await Future.delayed(Duration(seconds: 1));
         if(start==false)j=i;
        setState(() {
        });
      }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Timer:$j"),
        ),
        body: Column(
          children: [
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
                    thumbShape: null),
              );
            },):Text(""),
            Expanded(
                child: GridView.builder(itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(!a[index] && x==1)
                            {
                              a[index]=true;
                              x=2;
                              pos1=index;
                            }
                          if(!a[index] && x==2)
                              {
                                a[index]=true;
                                x=3;
                                pos2=index;
                                if(pic1[pos1]==pic1[pos2])
                                  {
                                    x=1;
                                    print("image match");
                                  }else
                                    {
                                      Future.delayed(Duration(milliseconds: 250)).then((value) {
                                        x=1;
                                        a[pos1]=false;
                                        a[pos2]=false;
                                        setState(() {

                                        });
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
                              a[11] == true)
                            {
                              start=true;
                            if(widget.ind!>=cur_level)
                              {
                                hard.prefs!.setInt("play1$cur_level", j);
                                cur_level++;
                                hard.prefs!.setInt("curs", cur_level);

                              }else
                                {
                                  int temp=hard.prefs!.getInt("timer${widget.ind}")??0;
                                  if(temp>=j)
                                    {
                                      hard.prefs!.setInt("timer${widget.ind}", j);
                                    }
                                }
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: Text("winner"),
                                  actions: [
                                    TextButton(onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return hard();
                                      },));
                                    }, child: Text("Ok"))
                                  ],
                                );
                              },);
                            }
                          setState(() {

                          });
                        },

                        child: Visibility(visible: a[index],
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Image.asset("${pic1[index]}"),
                          ),replacement:Container(
                          height: 100,
                          width: 100,
                          color: Colors.teal,
                        ) ,
                        ),
                      );
                    },))
          ],
        ));
  }
}
