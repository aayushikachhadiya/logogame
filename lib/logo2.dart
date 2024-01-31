import 'package:demo/data_image.dart';
import 'package:demo/logo3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logo1.dart';

void main() {
  runApp(MaterialApp(
    home: logo2(),
    debugShowCheckedModeBanner: false,
  ));
}

class logo2 extends StatefulWidget {
List? l;
logo2([this.l]);
  @override
  State<logo2> createState() => _logo2State();
}

class _logo2State extends State<logo2> {
@override
  void initState() {
  // TODO: implement initState
  super.initState();

}
List l=[];
  List level_icon = [
    "myasset/logo/level_button_red_circle.png",
    "myasset/logo/level_button_yellow_circle.png",
    "myasset/logo/flaga_cl_locked.png",
    "myasset/logo/level_button_locked_circle.png",
    "myasset/logo/level_button_locked_circle.png",
    "myasset/logo/level_button_locked_circle.png",
    "myasset/logo/level_button_locked_circle.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chose level"),
        backgroundColor: Colors.indigo,
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: data_image.level.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return logo3(index);
                  },));
                },
                child: ListTile(
                  title: Text("${data_image.level[index]}"),
                  leading: Image.asset("${level_icon[index]}"),
                ),
              ),
            );
          },
        ))
      ]),
    );
  }
}
