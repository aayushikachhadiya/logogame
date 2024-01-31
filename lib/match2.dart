import 'package:demo/match1.dart';
import 'package:flutter/material.dart';

import 'match3.dart';

class match2 extends StatefulWidget {
  String ?page;
  match2([this.page]);

  @override
  State<match2> createState() => _match2State();
}

class _match2State extends State<match2> {
  List l = [];
  List n = [];
  int cur_level = 0;
  int normal = 0;
  int cur = 0;
  int second = 0;
  int nor = 0;
   String route="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("page royti:${widget.page}");
    if (widget.page == "No time limit")
    {
      cur_level = match1.prefs!.getInt("cur") ?? 0;
      l = List.filled(60, "");
      for (int i = 0; i < cur_level; i++) {
        l[i] = match1.prefs!.getInt("play$i") ?? "0";
      }
    }else  if(widget.page=="Normal")
      {
        normal = match1.prefs!.getInt("time") ?? 0;
        n= List.filled(60, "");
        for (int i = 0; i < normal; i++) {
          n[i] = match1.prefs!.getInt("start$i") ?? "0";
        }
      }
    print(l);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Level",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.teal,
        actions: [
          Text("NO TIME LIMIT",
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(left: 20, top: 15, bottom: 100),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, myindex) {
            return Container(
                alignment: Alignment.center,
                height: double.infinity,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.teal, width: 3)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      child: Text("MATCH $myindex",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(itemCount: 10,
                            itemBuilder: (context, index) {
                          cur = (myindex * 10)+index;
                          print("Cur:$cur");
                          print("Level:${cur_level}");
                          nor = (myindex * 10) + index;
                          return Card(
                            child: InkWell(
                              onTap: () {
                              if((myindex*10)+index<=cur_level)
                                {
                                  print("Hi..");
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return match3(l, (myindex * 10) + index,widget.page);
                                    },
                                  ));
                                }else
                                  {
                                    print("Hello");
                                  }
                              },
                              child: ListTile(
                                tileColor:((widget.page=="No time limit")? (cur >= cur_level + 1): (nor >= normal + 1))
                                    ? Colors.teal.shade200
                                    : Colors.teal,
                                title: Text("LEVEL ${cur}"),
                                trailing: (widget.page == "No time limit")
                                    ? Text(" ${l[((myindex * 10) + index)]}",
                                        style: TextStyle(fontSize: 15))
                                    : Text(" ${n[((myindex * 10) + index)]}",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ),
                          );
                        },),
                      ),
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }
}
