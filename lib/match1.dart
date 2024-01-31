import 'package:demo/hard1.dart';
import 'package:demo/match2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: match1(),
    debugShowCheckedModeBanner: false,
  ));
}

class match1 extends StatefulWidget {
  const match1({super.key});
  static SharedPreferences ?prefs;

  @override
  State<match1> createState() => _match1State();
}

class _match1State extends State<match1> {
  String page="";
  int inadex=0;
  List image=[
    "gato.png",
    "perro.png",
    "paloma.png",
    "cerezas.png",
    "platano.png",
    "cono.png",
    "hoja_oto+¦o.png",
    "rosa.png",
    "loro.png",
    "campana.png",
    "ciruela.png",
    "cerezas.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  List l=List.filled(60,'');
  List n=List.filled(60,'');
  get()
  async {
    match1.prefs = await SharedPreferences.getInstance();
    if(page=="No time limit")
      {
        int  cur_level = match1.prefs!.getInt("cur") ?? 0;
        for(int i=0;i<cur_level;i++)
        {
          l[i]=match1.prefs!.getInt("play$i")??"0";
        }
      }else  if(page=="Noraml")
        {
          int  normal = match1.prefs!.getInt("time") ?? 0;
          for(int i=0;i<normal;i++)
          {
            n[i]=match1.prefs!.getInt("start$i")??"0";

          }
        }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Select mode",
          ),
          backgroundColor: Colors.teal,
          actions: [
            // Icon(Icons.s)
          ],
        ),
        body: Container(margin: EdgeInsets.only(top: 50),
          child: Stack(children: [
            GridView.builder(
              itemCount: image.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.greenAccent[200],
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("myasset/match/${image[index]}"),
                    ),
                  ),
                );
              },
            ),
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  border: Border.all(color: Colors.teal, width: 5),
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(left: 90, right: 70, top: 50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            page="No time limit";
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return match2(page);
                            },));
                            setState(() {
                            });
                          },
                          child: Container(
                      color: Colors.teal,
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      child: Text("NO TIME LIMIT",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      margin: EdgeInsets.all(10),
                    ),
                        )),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            page="Normal";
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return match2(page);
                            },));
                            setState(() {

                            });
                          },
                          child: Container(
                      color: Colors.teal,
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      child: Text("NORMAL",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      margin: EdgeInsets.all(10),
                    ),
                        )),
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return hard();
                            },));
                          },
                          child: Container(
                      color: Colors.teal,
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      child: Text("HARD",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      margin: EdgeInsets.all(10),
                    ),
                        ))
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 110, right: 120, top: 320,bottom: 100),
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(   color: Colors.teal.shade50,
                  border: Border.all(color: Colors.teal, width: 3)),
              child: Container(margin: EdgeInsets.all(10),
                color: Colors.teal,
                alignment: Alignment.center,
                child: Text("REMOVE ADS",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 400,bottom: 30),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration( color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal,width: 3)
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.teal,
                        alignment: Alignment.center,
                        child: Text("SHARE",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                  Expanded(
                      child: Container(margin: EdgeInsets.all(10),
                        color: Colors.teal,
                        alignment: Alignment.center,
                        child: Text("MORE GAMES",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                ],

              ),

            ),
            Container(
              margin: EdgeInsets.only( top: 600),
              color: Colors.teal,
              height: double.infinity,
              width: double.infinity,
            )
          ]),
        ));
  }
}
