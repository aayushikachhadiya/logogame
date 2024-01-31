import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:demo/level.dart';
import 'package:demo/math.dart';

import 'math1.dart';

class win extends StatefulWidget {
  int index;
  bool ?is_skip;
  win(this.index, [this.is_skip]);



  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
  @override
  Widget build(BuildContext context) {

    Future<File> getImageFileFromAssets(String path) async {
      final byteData = await rootBundle.load('$path');

      final file = File('${(await getTemporaryDirectory()).path}/$path');
      await file.create(recursive: true);
      await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      return file;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("myasset/math/background.jpg"))),
          child: Column(
            children: [
              Expanded(
                  child: Container(margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Puzzel  Completed",
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("myasset/math/trophy.png"))),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return math1(widget.index,widget.is_skip);
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 30, 5),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text("CONTINUE",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return math();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 30, 5),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text("MAIN MENU",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 10, 30, 5),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text("BUY PRO",
                      style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: Container(
                  margin:
                  EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
                  alignment: Alignment.center,
                  child: Text("SHARE THIS PUZZEL",
                      style: TextStyle(fontSize: 30, color: Colors.blue)),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    getImageFileFromAssets("myasset/math/${level.share[widget.index-1]}").then((value) {
                      print(value.path);
                      Share.shareFiles(['${value.path}']);
                    });
                  },
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 120,right: 120,bottom: 30),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("myasset/math/shareus.png"))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
