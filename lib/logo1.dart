import 'package:demo/logo2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: logo1(),
    debugShowCheckedModeBanner: false,
  ));
}

class logo1 extends StatefulWidget {
  static SharedPreferences ?prefs;
  const logo1({super.key});

  @override
  State<logo1> createState() => _logo1State();
}

class _logo1State extends State<logo1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  List l=[];
  get()
  async {
    logo1.prefs = await SharedPreferences.getInstance();
    int point=logo1.prefs!.getInt("points")??0;
    for(int i=0;i<20;i++)
    {
      l[i]=logo1.prefs!.getString("Wins$i")??'';
      setState(() {
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(children: [
          Expanded(
            child: Container(
              height: 100,
              width: double.infinity,
              child: Row(children: [
                Expanded(child: Container(
                  child: Column(children: [
                    Expanded(child: Container(margin: EdgeInsets.only(top: 10,right: 40),
                      child: Text("Logo game",style: TextStyle(fontSize: 30)),
                    )),
                    Expanded(child: Container(
                      child: Text("Quize your brands Knowledge",style: TextStyle(fontSize: 15)),
                    ))
                  ]),
                )),
                Expanded(child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.fill,image: AssetImage("myasset/logo/p2.jpeg"))
                  ),
                )),
              ]),
            ),
          ),
          Expanded(flex: 2,child: InkWell(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return logo2(l);
                        },));
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("myasset/logo/main_button_play.png")
                )
              ),
              child: Container(alignment: Alignment.center,child: Text("PLAY",style: TextStyle(fontSize: 30,color: Colors.white)),)
            ),
          )),
          Expanded(flex: 2,
              child: Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Expanded(child: Text("")),
                    Expanded(child: Container(margin: EdgeInsets.only(right: 20),child:
                    Image.asset("myasset/logo/main_button_ranking.png")
                      ,)),
                    Expanded(child: Container(margin: EdgeInsets.only(right: 20),
                      child: Image.asset("myasset/logo/main_button_stats.png"),
                    )),
                    Expanded(child: Container(margin: EdgeInsets.only(right: 20),child:
                    Image.asset("myasset/logo/main_button_achievements.png"),
                    )),
                    Expanded(child: Text("")),
                  ],)
              )),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.fill,image: AssetImage("myasset/logo/p1.jpeg"))
                ),
              )),
        ]),
      )
    );
  }
}
