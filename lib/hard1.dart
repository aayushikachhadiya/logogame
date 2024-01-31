import 'package:demo/hard2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class hard extends StatefulWidget {
  static SharedPreferences ?prefs;
  const hard({super.key});

  @override
  State<hard> createState() => _hardState();
}

class _hardState extends State<hard> {
  int cur_level=0;
  int cur=0;
  List l=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  get()
  async {
    hard.prefs = await SharedPreferences.getInstance();
    cur_level=hard.prefs!.getInt("curs")??0;
    l = List.filled(60, "");
    for(int i=0;i<cur_level;i++)
      {
        l[i]=hard.prefs!.getInt("play1$i") ?? "0";
      }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hard"),),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(left: 20,bottom: 100,top: 15),
        child: ListView.builder(itemCount: 6,scrollDirection: Axis.horizontal,itemBuilder: (context, myindex) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              border: Border.all(color: Colors.teal,width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Container(
                child: Text("Match"),
              ),
              Expanded(child: Container(child: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
                cur=(myindex*10)+index+1;
                return Card(child: InkWell(
                  onTap: () {
                if((myindex*10)+index+1<=cur_level)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return hard2((myindex*10)+index+1);
                    },));
                  }else
                    {
                      print("hello");
                    }
                setState(() {
                });
                  },
                  child: ListTile(
                    title: Text("Lvel ${cur}"),
                    tileColor: (cur >= cur_level + 1)?Colors.teal.shade50:Colors.teal,
                    trailing: Text("${l[cur]}")
                  ),
                ),);
              },),))
            ]),
          );
        },),
      ),
    );
  }
}
